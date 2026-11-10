# Text-to-Music Research Reading Queue — 2026-11-10

## First technical cluster
1. MusicGen / AudioCraft: text conditioning, compressed audio tokens, autoregressive generation, classifier-free guidance and ablations.
2. AudioLDM / CLAP: language-audio joint embedding, contrastive alignment and latent diffusion.
3. Stable Audio Open: T5 text conditioning, autoencoder latents and diffusion transformer.
4. MusicLM: hierarchical generation and long-range musical structure.
5. Recent music-generation surveys: controllability, disentanglement, evaluation and dataset bias.

## Questions to extract from every paper
- What text encoder/tokenizer is used?
- Is the text representation pooled or token-sequential?
- How does text conditioning enter the audio model?
- What audio codec/latent representation is used?
- Which properties are controllable, and how are they measured?
- What happens under prompt conflict or semantic ambiguity?
- What ablations isolate the contribution of text, audio, reference inputs and sampling?
- What training data and data licenses are disclosed?
- Which results are specific to the studied model and must not be projected onto Suno?

## Suno-specific research boundary
Suno's private architecture is not established by these papers. Use open models to develop mechanistic hypotheses and comparative experiments, not as evidence of Suno internals.
