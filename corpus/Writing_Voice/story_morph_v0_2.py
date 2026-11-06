from __future__ import annotations
from dataclasses import dataclass, field, asdict
from typing import Any, Dict, List, Optional, Set, Tuple
import copy, hashlib, json, random

def stable_hash(obj: Any, n: int = 16) -> str:
    raw = json.dumps(obj, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode()
    return hashlib.sha256(raw).hexdigest()[:n]

@dataclass
class Fact:
    id: str
    subject: str
    predicate: str
    object: Any
    truth: bool = True
    layer: str = "world"
    source: str = ""

@dataclass
class Belief:
    id: str
    holder: str                 # character id or "reader"
    fact_id: str
    stance: str                 # believes_true | believes_false | suspects | unknown
    confidence: str = "medium"  # low | medium | high
    acquired_at: str = ""
    source: str = ""

@dataclass
class Event:
    id: str
    label: str
    story_order: int
    world_order: int
    participants: List[str] = field(default_factory=list)
    causes: List[str] = field(default_factory=list)
    effects: List[str] = field(default_factory=list)
    reveals: List[str] = field(default_factory=list)
    source: str = ""

@dataclass
class Relation:
    id: str
    source: str
    target: str
    type: str
    layer: str
    required: bool = False
    attrs: Dict[str, Any] = field(default_factory=dict)

@dataclass
class Dependency:
    id: str
    inputs: List[str]
    output: str
    relation: str
    layer: str
    severity: str = "hard"
    rationale: str = ""

@dataclass
class Reinterpretation:
    id: str
    trigger_event: str
    prior_ids: List[str]
    old_reading: str
    new_reading: str
    audiences: List[str]
    source: str = ""

@dataclass
class Bud:
    id: str
    kind: str
    reason: str
    requirements: Dict[str, Any]
    source_ids: List[str]
    status: str = "latent"
    expanded: bool = False

@dataclass
class Focus:
    anchors: List[str]
    causal_depth: int = 3
    epistemic_depth: int = 3
    symbolic_depth: int = 2
    motivational_depth: int = 2
    emergence_depth: int = 0

@dataclass
class Mutation:
    op: str
    target: str
    args: Dict[str, Any]
    mutation_id: str = ""

    def normalized(self):
        return {"op": self.op, "target": self.target, "args": self.args}

    def ensure_id(self):
        if not self.mutation_id:
            self.mutation_id = "mut_" + stable_hash(self.normalized(), 12)
        return self

@dataclass
class WorldState:
    state_id: str
    parent_state_id: Optional[str]
    entities: Dict[str, Dict[str, Any]]
    facts: Dict[str, Fact]
    beliefs: Dict[str, Belief]
    events: Dict[str, Event]
    relations: Dict[str, Relation]
    dependencies: Dict[str, Dependency]
    reinterpretations: Dict[str, Reinterpretation]
    buds: Dict[str, Bud] = field(default_factory=dict)
    metadata: Dict[str, Any] = field(default_factory=dict)

    def canonical(self):
        return asdict(self)

    def rehash(self):
        data = self.canonical()
        data["state_id"] = ""
        self.state_id = "state_" + stable_hash(data, 20)
        return self

class Engine:
    def clone(self, s: WorldState) -> WorldState:
        return copy.deepcopy(s)

    def apply(self, s: WorldState, m: Mutation):
        m.ensure_id()
        if m.op == "change_relation":
            s.relations[m.target].type = m.args["type"]
        elif m.op == "set_belief":
            b = s.beliefs[m.target]
            for k,v in m.args.items(): setattr(b,k,v)
        elif m.op == "set_fact":
            f = s.facts[m.target]
            for k,v in m.args.items(): setattr(f,k,v)
        elif m.op == "remove_relation":
            s.relations.pop(m.target)
        elif m.op == "set_event":
            e = s.events[m.target]
            for k,v in m.args.items(): setattr(e,k,v)
        else:
            raise ValueError(f"Unknown mutation op: {m.op}")
        return s.rehash()

    def validate(self, s: WorldState):
        issues = []
        ids = set(s.entities)|set(s.facts)|set(s.events)|set(s.relations)|set(s.beliefs)
        for d in s.dependencies.values():
            missing = [x for x in d.inputs if x not in ids]
            if d.output not in ids: missing.append(d.output)
            if missing:
                issues.append({"dependency":d.id,"severity":d.severity,
                               "message":"missing structural input/output","missing":missing})
        # Required relations retain their relation type.
        for rid,r in s.relations.items():
            expected = r.attrs.get("required_type")
            if r.required and expected and r.type != expected:
                issues.append({"dependency":rid,"severity":"hard",
                               "message":f"required relation changed {expected} -> {r.type}"})
        return issues

    def consequences(self, before: WorldState, after: WorldState, m: Mutation):
        touched = {m.target}
        changed_layers = set()
        if m.target in after.relations:
            r=after.relations[m.target]; touched|={r.source,r.target}; changed_layers.add(r.layer)
        if m.target in after.beliefs:
            b=after.beliefs[m.target]; touched|={b.holder,b.fact_id}; changed_layers.add("epistemic")
        if m.target in after.facts:
            f=after.facts[m.target]; touched|={f.subject}; changed_layers.add(f.layer)
        if m.target in after.events:
            e=after.events[m.target]; touched|=set(e.participants); changed_layers.add("event")
        # dependency closure
        grew=True
        while grew:
            grew=False
            for d in after.dependencies.values():
                universe=set(d.inputs+[d.output])
                if touched & universe and not universe <= touched:
                    touched |= universe; changed_layers.add(d.layer); grew=True
        return sorted(touched), sorted(changed_layers)

    def buds_from_issues(self, issues, m):
        buds={}
        for i,x in enumerate(issues):
            payload={"issue":x,"mutation":m.normalized()}
            bid="bud_"+stable_hash(payload,12)
            buds[bid]=Bud(bid,"repair_requirement",x["message"],payload,[m.target])
        return buds

    def select(self, mutations: List[Mutation], seed: int):
        for m in mutations: m.ensure_id()
        ids=sorted(m.mutation_id for m in mutations)
        rng=random.Random(seed)
        selected=rng.choice(sorted(mutations,key=lambda x:x.mutation_id))
        return selected, {"mode":"seeded_discrete","seed":seed,
                          "candidate_mutation_ids":ids,
                          "selected_mutation_id":selected.mutation_id}

    def transact(self, s: WorldState, m: Mutation, focus: Focus,
                 selection=None, commit_on_hard=False):
        before_hash=stable_hash(s.canonical(),32)
        candidate=self.apply(self.clone(s),m)
        issues=self.validate(candidate)
        buds=self.buds_from_issues(issues,m)
        candidate.buds.update(buds)
        hard=any(x["severity"]=="hard" for x in issues)
        committed=(not hard) or commit_on_hard
        current=candidate if committed else s
        affected,layers=self.consequences(s,candidate,m)
        record={
          "schema_version":"0.2",
          "engine_version":"0.2",
          "run_id":"run_"+stable_hash({"parent":s.state_id,"mutation":m.normalized()},20),
          "parent_state_id":s.state_id,
          "candidate_state_id":candidate.state_id,
          "committed_state_id":current.state_id,
          "selection":selection or {"mode":"explicit"},
          "mutation":m.normalized()|{"mutation_id":m.mutation_id},
          "focus":asdict(focus),
          "impact":{"affected_ids":affected,"layers":layers},
          "validation":{"issues":issues,"hard_block":hard},
          "emergence":{"buds":[asdict(x) for x in buds.values()]},
          "outcome":"committed" if committed else "blocked",
          "integrity":{
             "state_hash_before":before_hash,
             "candidate_hash":stable_hash(candidate.canonical(),32),
          },
        }
        # Hash-chain-ready canonical record. timestamp intentionally omitted from hash.
        record["integrity"]["record_hash"]=stable_hash(record,32)
        record["views"]={
          "succinct":{
             "run":record["run_id"],"outcome":record["outcome"],
             "mutation":f"{m.op}:{m.target}",
             "layers":layers,"affected":len(affected),
             "issues":len(issues),"buds":len(buds)
          },
          "detailed":{
             "candidate":candidate.state_id,"committed":current.state_id,
             "affected_ids":affected,"issues":issues,
             "buds":[asdict(x) for x in buds.values()]
          },
          "full":{
             "candidate_state":candidate.canonical(),
             "committed_state":current.canonical()
          }
        }
        return current,record
