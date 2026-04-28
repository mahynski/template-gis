# geoai

Demonstrations for [GeoAI](https://github.com/opengeos/geoai) — a high-level Python toolkit for Earth observation machine learning. GeoAI wraps TorchGeo and segmentation_models.pytorch behind simplified APIs and adds direct integrations with STAC catalogs, Earth Engine, and Leafmap for interactive visualization.

**Why use GeoAI?** When you want to move quickly from raw satellite imagery to a trained model without assembling individual pipeline components. GeoAI handles data search, chip generation, model training, and result visualization in a unified interface.

> **Note on install name**: The PyPI package is `geoai-py` (not `geoai`). After installation, `import geoai` works correctly.

## Setup

~~~bash
cd demo/geoai
uv sync --no-install-workspace
uv run ipython kernel install --user --env VIRTUAL_ENV ../../.venv --name=geoai
~~~

Select the `geoai` kernel in JupyterLab.

## Notebooks

| Notebook | Topic |
|---|---|
| `geoai/0-overview_and_data.ipynb` | Library overview, STAC search, chip generation |
| `geoai/1-segmentation_training.ipynb` | Training a segmentation model end-to-end |
| `geoai/2-object_detection.ipynb` | Object detection with YOLO wrapper and Leafmap viz |
| `geoai/3-change_detection.ipynb` | Bitemporal change detection pipeline |

## References

- GitHub: https://github.com/opengeos/geoai
- Book: https://book.opengeoai.org/
- Docs: https://geoai.gishub.org/
