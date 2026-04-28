# Demos

This directory contains demonstrations for GIS AI/ML libraries.
Each subdirectory is an isolated [uv](https://docs.astral.sh/uv/) project with its own virtual environment.

## Setup

From any demo group directory:

~~~bash
cd demo/<group_name>
uv sync --no-install-workspace
uv run ipython kernel install --user --env VIRTUAL_ENV ../../.venv --name=<group_name>
~~~

Then select the `<group_name>` kernel in JupyterLab.

> **HuggingFace token**: `Prithvi`, `TESSERA`, and `GeoChat` models may require a HF token.
> Copy `.env.example` → `.env` and set `HF_TOKEN=<your_token>`.

> **GPU**: All demos run CPU-only for exploration, but inference is much faster with a GPU.
> `GeoChat` specifically requires a GPU with ≥12 GB VRAM.

> **Model weights**: SAM (segment-geospatial), GeoChat, and Prithvi weights are downloaded on
> first use and may be several hundred MB to several GB.

---

## Raster Vision — `raster_vision/`

**Why use this?** Best choice when you need a complete, opinionated end-to-end pipeline for
semantic segmentation or object detection on large satellite scenes. Raster Vision handles
the tedious parts automatically: chipping large scenes into training windows, running
inference across a full image with stride, and reassembling predictions. Use it when you
have labeled data and want a production-grade training-to-inference workflow without
assembling the pieces yourself.

---

## TorchGeo + TerraTorch — `torch_projects/`

**Why use TorchGeo?** The foundational library for geospatial deep learning in PyTorch.
Use it when you need geospatially-aware data loading — it handles CRS alignment, resolution
matching, and temporal stacking so you can focus on the model. It ships datasets, samplers,
transforms, and pretrained weights for dozens of benchmark tasks. If you are building a
custom training loop on satellite or aerial imagery, start here.

**Why use TerraTorch?** When you want to fine-tune IBM/NASA's Prithvi foundation model
(or other geospatial foundation models) with minimal boilerplate. TerraTorch provides
task-specific decoder heads and a Lightning-based training API on top of TorchGeo. Use it
when transfer learning from a pretrained geospatial backbone is the right strategy and you
do not want to wire up the fine-tuning pipeline yourself.

---

## segment-geospatial (samgeo) — `opengeos_tools/`

**Why use this?** When you need to segment objects in satellite or aerial imagery but have
**no labeled training data**. SAM (Segment Anything Model) is a zero-shot segmentation model
— you provide a point, bounding box, or text prompt and it delineates the object. samgeo
wraps SAM so it works natively on georeferenced GeoTIFFs and exports results with proper
coordinate reference systems. Use it for rapid extraction of buildings, fields, water bodies,
or any other visible feature without a labeling effort.

---

## SAHI + GeoDeep — `object_detection/`

**Why use SAHI?** When your detector misses small objects in large images. SAHI tiles the
image into overlapping patches, runs any YOLO or DETR detector on each tile, then merges
results — typically improving small-object AP by 5–7% with no model retraining. It works
as a drop-in wrapper around existing detectors.

**Why use GeoDeep?** When you want the absolute lowest setup friction for object detection
on GeoTIFFs. GeoDeep ships pre-built ONNX models (cars, buildings, trees) and only requires
`rasterio` + `onnxruntime` — no PyTorch, no CUDA. Deploy on edge hardware or in environments
where a full deep learning stack is not feasible.

---

## GeoAI — `geoai/`

**Why use this?** When you want a high-level, opinionated toolkit that handles the full
EO ML workflow — data search/download, chip generation, training, and map visualization —
without assembling a pipeline from lower-level libraries. GeoAI wraps TorchGeo and
segmentation_models.pytorch behind simpler APIs and adds direct integrations with Earth
Engine, STAC catalogs, and interactive Leafmap visualizations. Best for users who want to
move quickly from raw satellite data to a trained model without deep framework expertise.

---

## Prithvi EO 2.0 + TESSERA — `foundation_models/`

**Why use Prithvi?** When you want to fine-tune a powerful geospatial foundation model
(300–600M parameters, trained on NASA HLS data) for a specific task such as flood mapping,
crop classification, or change detection. Prithvi provides strong pretrained spatial-spectral
representations that transfer well with small labeled datasets. Accessed via HuggingFace
`transformers`; fine-tune with `peft` LoRA adapters to reduce compute requirements.

**Why use TESSERA?** When your task is inherently temporal — land cover change over seasons,
vegetation phenology, crop type mapping — and you want embeddings that encode *time-series*
patterns rather than single-image features. TESSERA processes multi-temporal Sentinel-1/2
sequences. `geotessera` provides a lightweight client for fetching pre-computed embeddings
that can be plugged directly into any scikit-learn or PyTorch classifier.

---

## Open-CD — `open_cd/`

**Why use this?** The most complete open-source library dedicated specifically to **change
detection**. If your task is "what changed between two dates?" — building footprint changes,
disaster damage assessment, deforestation monitoring — Open-CD provides 20+ state-of-the-art
methods (ChangeFormer, BAN, TTP, and more) with a unified training and evaluation interface.
Built on OpenMMLab, so it integrates with the broader mmdet/mmseg ecosystem for custom configs.

---

## GeoChat — `geochat/`

**Why use this?** When you want to **ask natural-language questions about satellite images**
rather than train a classifier. GeoChat is a vision-language model fine-tuned on 318k remote
sensing instruction pairs; it supports scene description, visual QA ("how many vehicles are
visible?"), region-level captioning, and referring object detection — all via text prompts.
Use it for exploratory image analysis, rapid triage of large image archives, or building
conversational remote sensing interfaces. Requires a GPU with ≥12 GB VRAM.
