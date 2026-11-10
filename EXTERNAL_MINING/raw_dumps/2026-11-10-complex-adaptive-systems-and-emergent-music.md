# External mining: complex adaptive systems and emergent music
Date: 2026-11-10

## Scope
Research pass on cellular automata, evolutionary computation, multi-agent composition, self-organization, creative ecosystems, and biologically inspired computation. These are models and compositional systems from the literature, not evidence about Suno's proprietary architecture.

## 1. MusicSwarm: decentralized agents and stigmergic coordination (2026)
Source: https://advanced.onlinelibrary.wiley.com/doi/10.1002/aisy.202501253
Preprint: https://arxiv.org/abs/2509.11973
Code: https://github.com/lamm-mit/MusicSwarm
Evidence type: peer-reviewed open-access research article.
Markus J. Buehler reports a system of decentralized, bar-wise agents based on identical frozen foundation models. Agents coordinate through peer-to-peer, stigmergic signals: they sense and deposit harmonic, rhythmic, and structural cues, use short-term memory, and reach consensus. The reported system generates coherent long-form compositions without updating model weights. The paper compares a centralized multi-agent system with a global critic against a decentralized swarm, reporting greater diversity, structural variety, and stronger results on its creativity metrics for the swarm.
Idea value: creative specialization can arise from interaction rules, shared memory, and consensus rather than from training different specialist models.
Caution: reported findings belong to the paper's system, design, datasets, and evaluation. Do not treat its performance claims as universal evidence that decentralized systems are always superior.

## 2. Musical agents: typology and state of the art (2019)
Source: https://www.tandfonline.com/doi/full/10.1080/09298215.2018.1511736
Repository record: https://research.chalmers.se/en/publication/540194
Evidence type: peer-reviewed review.
Kıvanç Tatar and Philippe Pasquier survey 78 musical-agent systems and develop a typology spanning musical tasks, autonomy, interaction, and creative roles. The paper situates musical metacreation at the intersection of generative arts, computational creativity, multi-agent systems, and AI.
Idea value: an agent need not be a whole composer. It can have a bounded musical task, role, interaction style, or degree of autonomy.

## 3. Biologically inspired and agent-based algorithms for music (2018)
Source: https://zenodo.org/records/1194152/files/EldridgeBown_2018_BioInspiredMusic.pdf
Evidence type: scholarly handbook chapter, accepted for Oxford Handbook of Algorithmic Music.
Alice Eldridge and Oliver Bown survey evolutionary search, multi-agent compositions, adaptive collaborators, self-organizing systems, and creative ecosystems. They connect biologically inspired music with artificial life, cybernetics, systems art, feedback, autonomy, and agency. The chapter treats ecological approaches as systems in which creative behaviors and structures can emerge through interactions rather than being specified as a complete score in advance.
Idea value: compose with an ecosystem of interacting processes, not just a sequence of notes or a list of instructions.

## 4. Cellular automata as musical generators (2023)
Source: https://www.mdpi.com/2076-3417/13/4/2401
DOI: https://doi.org/10.3390/app13042401
Evidence type: peer-reviewed research article.
Eduardo Reck Miranda and Hari Shaji discuss partitioned quantum cellular automata for generative music. Cellular automata evolve states over space and time according to local rules; the musical problem is to design the evolution and map its changing patterns into musical form.
Idea value: local interactions can generate global patterns. Different mappings from cell states to sound can produce very different musical realizations from the same underlying evolution.
Caution: a cellular automaton's behavior depends on neighborhood, update rule, initial state, boundary conditions, and mapping into sound.

## 5. Artificial Life Music: L-systems, cellular automata, and genetic algorithms (2011)
Source: https://suspended-chord.info/static/archived-course-pages/416/pdf/alm-report-final.pdf
Evidence type: academic project report.
Jacob Peck describes a generative composition program combining L-systems, cellular automata, and genetic algorithms to produce melodies. It includes an implementation description and analysis of abstractions and results.
Idea value: combine different generative mechanisms in one composition pipeline, with each mechanism responsible for a different level of structure.
Caution: student research report, not a peer-reviewed benchmark.

## 6. Evolutionary music: applying evolutionary computation to music composition (2020)
Source: https://doi.org/10.1007/s10710-020-09380-7
Open PDF: https://ncra.ucd.ie/papers/LoughranONeillGPEM2020.pdf
Evidence type: peer-reviewed review.
Róisín Loughran and Michael O'Neill review genetic programming and evolutionary computation in music. They compare representations, musical tasks, algorithms, and fitness measures. They stress that there is no single best evolutionary method or single objective for music composition. A system's search behavior depends strongly on its representation and fitness function.
Idea value: evolution does not require one fixed definition of improvement. Fitness can be multi-objective, shifting, subjective, or partly supplied by a human.
Caution: fitness functions can bias a system toward what is easy to measure rather than what is musically interesting.

## 7. At the crossroads of evolutionary computation and music (2004)
Source: https://pubmed.ncbi.nlm.nih.gov/15157372/
DOI: https://doi.org/10.1162/106365604773955120
Evidence type: peer-reviewed journal article.
Eduardo Reck Miranda discusses engineering, creative, and musicological approaches to evolutionary computation, including genetic algorithms, cellular-automata sound synthesis, composition, and models of melody evolution.
Idea value: evolutionary systems can be used to generate artifacts, explore design spaces, or investigate theories about how musical forms evolve. Those are different goals.

## 8. Creative DNA computing: splicing systems for music composition (2022)
Source: https://link.springer.com/article/10.1007/s00500-022-06828-z
Evidence type: peer-reviewed open-access research article.
Roberto De Prisco and Rocco Zaccagnino review three approaches to DNA-inspired splicing systems for automatic composition, including four-voice music and jazz solos. Splicing systems mimic recombination: sequences are cut at pattern-defined sites and fragments are rejoined according to rules.
Idea value: musical recombination can be based on local compatibility and splice rules, rather than simple concatenation or random collage.
Caution: the paper notes that practical splicing-system applications remain relatively few.

## 9. Generative music with partitioned quantum cellular automata (2023)
Source: https://www.mdpi.com/2076-3417/13/4/2401
DOI: https://doi.org/10.3390/app13042401
Evidence type: peer-reviewed research article.
The paper frames cellular automata as dynamic systems whose states evolve through local space-time rules, and explores their use for generating music. The important design choices include the automaton, its initial state, the update process, and the mapping from evolved states to musical events.
Idea value: a visual or abstract state field can be the source representation; music is one possible decoding of its evolution.

## 10. Computational creativity and music generation systems (2020)
Source: https://www.frontiersin.org/journals/artificial-intelligence/articles/10.3389/frai.2020.00014/full
DOI: https://doi.org/10.3389/frai.2020.00014
Evidence type: peer-reviewed review.
Filippo Carnovalini and Antonio Rodà survey music-generation approaches including Markov chains, formal grammars, rule/constraint systems, neural models, evolutionary/genetic algorithms, chaos/self-similarity, and agent-based systems. They emphasize the difficulty of defining and evaluating creativity and note that agents can model musical behavior through cooperative interaction.
Idea value: treat generative methods as different kinds of engines with different affordances, not interchangeable prompt styles.

## 11. Biologically inspired models as a design vocabulary
Across these sources, recurring mechanisms include:
- local rules and neighborhoods;
- feedback loops;
- adaptation and memory;
- mutation and recombination;
- selection and multi-objective fitness;
- competition and cooperation;
- stigmergy, where agents coordinate by modifying a shared environment;
- consensus and role differentiation;
- self-organization and phase transitions;
- ecological niches and resource constraints.

These mechanisms can be used as metaphors, prompt structures, procedural pre-composition tools, or actual code-based generators. Those are separate levels of implementation.

## 12. Important distinctions
- Cellular automata are not neural networks.
- Evolutionary search is not simply random variation; selection and representation shape the search.
- Multi-agent systems do not automatically create useful diversity or coherence.
- Stigmergy is indirect coordination through changes to a shared environment; it differs from direct messages.
- Emergence is not synonymous with unpredictability. A system can be unpredictable but unstructured, or structured but surprising.
- Fitness functions are not neutral; they encode a particular notion of success.
- A research system's capabilities do not imply Suno exposes equivalent controls.

## Retrieval date
2026-11-10
