# foundation_models

Demonstrations for two open geospatial foundation models:

- **[Prithvi EO 2.0](https://huggingface.co/ibm-nasa-geospatial)** — IBM + NASA's family of geospatial vision transformers (300M–600M parameters) trained on NASA's Harmonized Landsat and Sentinel-2 (HLS) dataset. Accessed via HuggingFace `transformers`.

- **[TESSERA](https://github.com/ucam-eo/tessera)** — A University of Cambridge foundation model for multi-temporal satellite time-series (Sentinel-1 + Sentinel-2). The `geotessera` client fetches pre-computed embeddings for regions of interest.

Both models share this environment since they are both HuggingFace-based and use compatible dependencies.

## Setup

~~~bash
cd demo/foundation_models
uv sync --no-install-workspace
uv run ipython kernel install --user --env VIRTUAL_ENV ../../.venv --name=foundation_models
~~~

Select the `foundation_models` kernel in JupyterLab.

## HuggingFace Token

Prithvi model weights and TESSERA-related resources may require a HuggingFace account token. Set it in your `.env` file (copy from `.env.example`):

~~~
HF_TOKEN=hf_your_token_here
~~~

The notebooks load this automatically via `dotenv_config.py`.

## Notebooks

### Prithvi EO 2.0

| Notebook | Topic |
|---|---|
| `prithvi/0-model_overview.ipynb` | Architecture, loading weights from HuggingFace |
| `prithvi/1-feature_extraction.ipynb` | Multi-temporal embeddings, PCA/UMAP visualization |
| `prithvi/2-finetuning_segmentation.ipynb` | Fine-tuning with peft LoRA for land-cover segmentation |

### TESSERA

| Notebook | Topic |
|---|---|
| `tessera/0-what_is_tessera.ipynb` | Model overview, geotessera client, GeoZarr format |
| `tessera/1-fetching_embeddings.ipynb` | Fetch pre-computed embeddings for a region |
| `tessera/2-downstream_classification.ipynb` | scikit-learn classifier on TESSERA vs Sentinel-2 features |

## References

- Prithvi HuggingFace: https://huggingface.co/ibm-nasa-geospatial
- Prithvi paper: https://arxiv.org/abs/2310.18660
- TESSERA GitHub: https://github.com/ucam-eo/tessera
- GeoTessera PyPI: https://pypi.org/project/geotessera/
