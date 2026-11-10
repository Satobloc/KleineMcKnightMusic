# Idea mine: global, local, and temporal musical information
Date: 2026-11-10

These are loose ingredients, not a proposed Workbench architecture or a test protocol.

## Structural distinctions worth playing with

- **Identity vs event:** one description establishes what kind of musical world this is; another specifies something that happens inside it.
- **State vs trajectory:** "tense" is a state; "tension accumulates, breaks, then leaves an exposed aftermath" is a trajectory.
- **Global vs local:** a whole-track instruction and a section-specific instruction may be different species of information, even when written in identical words.
- **Attribute vs relation:** "piano, drums, voice" names ingredients; "the piano anticipates the vocal while the drums refuse the downbeat" describes a relationship.
- **Reference vs transformation:** a reference can be treated as something to preserve, something to mutate, or something to argue with.
- **Position as meaning:** where an instruction appears may matter as much as its wording. Order, adjacency, recurrence, and duration can carry information.
- **Composability vs interference:** two instructions may reinforce, coexist independently, compete, or cause one another to mutate.
- **Precision vs expressive slack:** tighter local constraints may increase predictability while reducing the room for unexpected but musically compelling developments.

## Possible information structures

- A whole-track identity statement paired with a sequence of local events.
- A timeline of changing energy, density, register, or emotional temperature.
- A melody or rhythm described as a contour rather than a named genre or instrument.
- A map of relationships: which part leads, shadows, interrupts, answers, or refuses another.
- A set of preservation/mutation pairs: keep the rhythm but replace the timbre; keep the vocal phrasing but change the harmonic environment.
- A reference fragment with explicit instructions about what should survive and what should be transformed.
- Two parallel timelines that occasionally converge or deliberately contradict.
- Instructions written as transitions rather than static states: emerge, accumulate, fracture, recede, return.
- A sparse prompt that gives only the turning points, leaving connective tissue unspecified.
- A dense prompt that specifies every local event, then tests whether detail survives or collapses into generic output.

## Experimental sparks for the future, not prescriptions

1. Express the same musical idea as a global description, a section map, a timeline, a relational diagram, and ordinary prose. Compare what changes.
2. Keep vocabulary constant while changing only its scope: whole track versus one section versus one moment.
3. Describe a trajectory without naming a genre. Then describe a genre without describing a trajectory.
4. Give two parts independent instructions, then give them relational instructions. Listen for whether interaction becomes more distinctive.
5. Use a reference as an anchor in one version and as an adversary in another.
6. Remove the middle of a detailed instruction sequence, leaving only beginning and ending states. See what the system invents between them.
7. Put the same instruction in different positions or repeat it at different intervals. Observe whether position or recurrence appears consequential.
8. Compare exact musical constraints with metaphorical descriptions of the same intended event.
9. Deliberately make local instructions conflict with global identity. The interesting result may be negotiation, not compliance.
10. Evaluate outputs on separate axes: adherence, coherence, expressiveness, individuality, surprise, and usefulness. Do not collapse them into one quality score.

## One useful conceptual shift
A prompt may be less like a description of a finished song and more like a set of relations distributed across a duration. That possibility is worth exploring without assuming Suno implements any particular research architecture.

## Evidence reminders
The research inspiration comes from Mustango (2024), Music ControlNet (2024), JASCO (2024), MuseControlLite (2025), global/local text conditioning work (2025), and a 2026 survey of music-generation controllability. See the matching raw dump and structured records for sources and limitations.
