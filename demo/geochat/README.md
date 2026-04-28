# geochat

Demonstrations for [GeoChat](https://github.com/mbzuai-oryx/GeoChat) — the first open-source grounded large vision-language model (VLM) for remote sensing, from MBZUAI (CVPR 2024).

GeoChat fine-tunes LLaVA-1.5 (a LLaMA-based VLM) on a 318k remote sensing instruction-following dataset. It supports:
- **Visual QA**: "How many vehicles are in this image?" / "What is the land cover in the center?"
- **Scene classification**: Zero-shot classification of satellite scenes
- **Region-level description**: Describe a specific sub-region given bounding-box coordinates
- **Grounded conversation**: Multi-turn dialogue about satellite imagery

## Requirements

> **GPU with ≥12 GB VRAM is required.**
> CPU-only inference is not feasible for a 7B LLM within a reasonable time.

For 12–16 GB GPUs, use 8-bit quantization via `bitsandbytes` (shown in notebook 0).

## Dependency Notes

GeoChat pins `torch==2.0.1` and `transformers==4.31.0`. These are hard requirements that cannot be loosened. **This environment is completely isolated and incompatible with all other demo environments in this repo.**

## Setup

~~~bash
cd demo/geochat
uv sync --no-install-workspace
uv run ipython kernel install --user --env VIRTUAL_ENV ../../.venv --name=geochat
~~~

Select the `geochat` kernel in JupyterLab.

### HuggingFace Token

The GeoChat model weights (`MBZUAI/GeoChat`) require a HuggingFace account:
1. Request access at https://huggingface.co/MBZUAI/GeoChat
2. Set `HF_TOKEN` in your `.env` file

## Notebooks

| Notebook | Topic |
|---|---|
| `geochat/0-setup_and_model_loading.ipynb` | Architecture, GPU requirements, 8-bit loading, smoke test |
| `geochat/1-visual_question_answering.ipynb` | Free-form QA, prompt format, comparison with generic LLaVA |
| `geochat/2-scene_classification.ipynb` | Zero-shot scene classification on UCM-21 / AID-30 |
| `geochat/3-grounded_conversation.ipynb` | Region-level grounding with bounding-box prompts |

## References

- GitHub: https://github.com/mbzuai-oryx/GeoChat
- Paper (CVPR 2024): https://arxiv.org/abs/2311.15826
- Model weights: https://huggingface.co/MBZUAI/GeoChat
