# External mining: information theory, entropy, compression, and emergence
Date: 2026-11-10

## Scope
This batch mines information-theoretic and procedural approaches to music: entropy, surprisal, predictive information, compression, algorithmic complexity, Markov processes, grammars, cellular automata, evolutionary systems, and emergence. These ideas are research ingredients, not claims about Suno's architecture or prompt interpretation.

## 1. Do not collapse entropy, surprisal, novelty, and complexity

### Auditory Expectation: The Information Dynamics of Music Perception and Cognition (Pearce & Wiggins, 2012)
Source: https://onlinelibrary.wiley.com/doi/10.1111/j.1756-8765.2012.01214.x
PDF: https://www.marcus-pearce.com/assets/papers/PearceWiggins2012.pdf
Evidence type: peer-reviewed review/theoretical paper.
The paper develops probabilistic models of musical expectation and describes information content (surprisal) as the unexpectedness of an event in context, while entropy describes uncertainty over possible continuations. It discusses time-varying information measures and predictive information rate as ways of characterizing unfolding musical structure.
Idea value: distinguish uncertainty before an event from the surprise produced by the event that actually occurs.

### Predictive uncertainty in auditory sequence processing (2014)
Source: https://pmc.ncbi.nlm.nih.gov/articles/PMC4171990/
Evidence type: peer-reviewed empirical research.
The study uses variable-order Markov models to select high- and low-entropy melodic contexts and compares listener judgments. Participants experienced greater uncertainty in high-entropy contexts; musical expertise was associated with more accurate probabilistic expectations.
Idea value: entropy is not just a property of a note sequence; it is relative to a learned predictive model and listener experience.

### Predictability and Uncertainty in the Pleasure of Music: A Reward for Learning? (2019)
Source: https://pmc.ncbi.nlm.nih.gov/articles/PMC6867811/
Evidence type: peer-reviewed empirical research.
The authors measure unpredictability as information content and uncertainty as entropy using IDyOM. They discuss intermediate complexity and the balance between prediction and surprise, while emphasizing that evidence for a simple universal inverted-U relation is mixed and difficult to test.
Idea value: avoid the simplistic maxim that more surprise is always better. The context and listener's learned expectations matter.

### Information dynamics: patterns of expectation and surprise in the perception of music (2009)
Source: https://www.tandfonline.com/doi/full/10.1080/09540090902733756
Evidence type: peer-reviewed research.
The paper proposes time-varying information measures and a predictive information rate, exploring how statistical structure changes as a piece unfolds. It uses Markov chains and minimalist music examples.
Idea value: a piece can be described by the changing dynamics of its predictability, not only by an average complexity score.

### Predictability and the pleasure of music (2025)
Source: https://pmc.ncbi.nlm.nih.gov/articles/PMC12377756/
Evidence type: peer-reviewed research.
Uses IDyOM-derived information content and entropy to investigate musical preference, reporting a balance between surprise and predictability that differs among individuals.
Idea value: there may be no single ideal entropy setting for all listeners or creative purposes.

## 2. Compression as a way to discover musical structure

### An investigation of music analysis by the application of grammar-based compressors (2021)
Source: https://www.tandfonline.com/doi/full/10.1080/09298215.2021.1978505
Evidence type: peer-reviewed research.
Uses grammar-based compression and the Minimum Description Length (MDL) principle to identify structural patterns in symbolic music. Repeated patterns can be stored once and referenced, producing a shorter description. The authors find useful structural information but also note limitations when patterns overlap or vary.
Idea value: compression can reveal repetition and hierarchy, while also exposing where a simple grammar fails to capture variation.

### Grammar-based compression and its use in symbolic music analysis (2023)
Source: https://www.tandfonline.com/doi/full/10.1080/17459737.2021.2002956
Evidence type: peer-reviewed research.
Uses context-free grammars to measure structural information in symbolic music strings. Grammar rules can compress repeated hierarchical patterns; related strings can be compared using information distance. The approach distinguishes genres, composers, and styles in the evaluated datasets.
Idea value: a reusable grammar can act as a fingerprint for a family of musical structures.

### The Interconnections of Music Structure, Harmony, Melody, Rhythm, and Predictivity (2024)
Source: https://journals.sagepub.com/doi/10.1177/20592043241234758
Evidence type: peer-reviewed research.
The paper represents phrase structures using repeated phrase labels and lengths, and selects among candidate structures using a description-length objective. It finds interactions between hierarchical repetition, harmony, melody, rhythm, and predictivity.
Idea value: a compact structural description may expose relations between layers that are difficult to see when each layer is analyzed separately.

### Minimum description length modelling of musical structure (2009)
Source: https://www.tandfonline.com/doi/abs/10.1080/17459730903313122
Evidence type: peer-reviewed research.
Uses statistical pattern extraction and Minimum Description Length to select quantitative models of musical structure.
Idea value: the simplest model that explains a piece can be a useful lens, but "simplest" depends on the representation and the permitted model family.

### Computational Creativity and Aesthetics with Algorithmic Information Theory (2021)
Source: https://pmc.ncbi.nlm.nih.gov/articles/PMC8700213/
Evidence type: peer-reviewed research.
Explores algorithmic information theory as a framework for modeling computational creativity and aesthetic properties. It considers how a compact generative program plus input data can describe an evolving sequence, and how new evidence may force revision of the inferred generator.
Idea value: ask not only what pattern is present, but what compact process could have generated it, and when later material forces that explanation to change.

## 3. Complexity is not just randomness

### Information-Theoretic Measures Predict the Human Judgment of Rhythm Complexity (2017)
Source: https://onlinelibrary.wiley.com/doi/10.1111/cogs.12347
Evidence type: peer-reviewed empirical research.
The study compares entropy rate and Kolmogorov complexity with human judgments of rhythm complexity and prediction difficulty. Both measures relate to judgments, with effects moderated by musical training.
Idea value: a rhythm's apparent complexity can be related to statistical predictability and algorithmic description length, not merely the number of events.

### Structures in Sound: Analysis of Classical Music Using the Information Length (2016)
Source: https://www.mdpi.com/1099-4300/18/7/258
Evidence type: peer-reviewed research.
Treats music as the evolution of a non-equilibrium system through probability distributions derived from MIDI data, using Fisher information geometry and information length to study changes in statistical state.
Idea value: musical change can be treated as movement through a space of statistical states, rather than only as a sequence of discrete labels.

### Information content of note transitions in the music of J. S. Bach (2024)
Source: https://doi.org/10.1103/PhysRevResearch.6.013136
Evidence type: peer-reviewed research.
Builds networks of notes and transitions to analyze information in Bach's music through network science, information theory, and statistical physics.
Idea value: a musical work can be explored as a network of possible transitions, not only a linear string.

### Quantifying the evolution of harmony and novelty in western classical music (2026)
Source: https://pmc.ncbi.nlm.nih.gov/articles/PMC13492798/
Evidence type: peer-reviewed research.
Distinguishes internal sequential dependence, event surprisal, and novelty relative to historical musical models. It uses a directed Kullback-Leibler divergence rate to quantify how much more information is needed to describe a piece under a historical transition model than under its own model.
Idea value: novelty is reference-dependent. A sequence can be internally coherent yet historically unusual, or internally unpredictable without being historically novel.

## 4. Procedural composition: rules, probability, and emergent behavior

### Computational Creativity and Music Generation Systems: An Introduction to the State of the Art (2020)
Source: https://pmc.ncbi.nlm.nih.gov/articles/PMC7861321/
Evidence type: peer-reviewed review.
Organizes algorithmic music generation into Markov chains, formal grammars, rule/constraint systems, neural networks/deep learning, evolutionary/genetic algorithms, chaos/self-similarity, and agent-based systems. It describes Markov chains as stochastic processes in which transitions depend on a current state or a finite history of states.
Idea value: different procedural families produce different relationships between explicit rules, chance, adaptation, and emergent structure.

### Rules, Probability, and Emergence: A Comparative Study of Traditional Algorithmic Composition Approaches (2026)
Source: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6482599
Evidence type: working paper/preprint.
Compares symbolic/rule-driven methods, optimization, complex systems, and statistical models, including L-systems, genetic algorithms, cellular automata, and Markov chains. It emphasizes differences in structural control, style simulation, creativity, and controllability.
Idea value: procedural systems are not interchangeable randomness machines. Their rule structures determine what can emerge and what can be controlled.
Caveat: SSRN working paper; not peer-reviewed evidence.

## 5. Contemporary generation and controllability context

### Recent advances in music generation: methods, evaluation, and challenges (2026)
Source: https://link.springer.com/article/10.1007/s10462-026-11582-x
Evidence type: peer-reviewed survey.
The survey spans symbolic, audio, and multimodal generation. It discusses distributional metrics, KL and Jensen-Shannon divergence, diversity and mode coverage, text-audio alignment, temporal control, and the difficulty of combining fine-grained constraints without losing naturalness or diversity.
Idea value: evaluating a generated result requires separate measures for adherence, diversity, coherence, and internal musical quality. One score cannot stand in for all of them.

### JAM: A Tiny Flow-based Song Generator with Fine-grained Controllability and Aesthetic Alignment (EMNLP Findings 2026)
Source: https://aclanthology.org/2026.findings-emnlp.48/
Evidence type: peer-reviewed conference paper.
JAM targets word-level timing and duration control in lyrics-to-song generation, and uses direct preference optimization with synthetic preference data for aesthetic alignment. The paper also introduces the JAME evaluation dataset.
Idea value: precision of control and preference alignment are distinct design problems, and can be studied separately.

## 6. Working vocabulary
- Entropy: uncertainty over possible next events under a model.
- Surprisal / information content: negative log probability of an event in context.
- Entropy rate: average uncertainty per event over a sequence.
- Mutual information: how much one variable or past context informs another.
- Predictive information: information in the past that helps predict the future.
- Redundancy: repeated or correlated information.
- Compression: a shorter representation made possible by exploitable regularity.
- Minimum Description Length: a model-selection principle balancing model size and residual data description.
- Algorithmic complexity: length of the shortest program that produces a sequence, generally not computable exactly for arbitrary sequences.
- Novelty: departure from a specified reference distribution or historical model.
- Emergence: higher-level organization arising from interactions among lower-level rules or processes.
- Mode collapse / reduced coverage: a generator overproducing a narrow subset of its possible output space.
- Creative slack: an informal term in this idea mine for degrees of freedom intentionally left unresolved.

## 7. Cautions
- Entropy depends on the chosen alphabet, representation, context, and probability model.
- Surprisal is not the same as entropy; novelty is not the same as either.
- Compression can expose repetition, but can also miss overlapping or expressive variation.
- Randomness does not guarantee complexity, coherence, or originality.
- Algorithmic complexity is not a direct measure of artistic value.
- Listener preference is heterogeneous; no single complexity optimum should be assumed.
- None of these studies reveals Suno's proprietary architecture or proves that a Suno prompt can directly set entropy or other internal quantities.

## Retrieval date
2026-11-10
