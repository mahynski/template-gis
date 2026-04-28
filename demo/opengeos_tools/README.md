# opengeos_tools

Demonstrations for [segment-geospatial (samgeo)](https://github.com/opengeos/segment-geospatial) — a Python package for segmenting geospatial data using the Segment Anything Model (SAM).

## Setup

~~~bash
cd demo/opengeos_tools
uv sync --no-install-workspace
uv run ipython kernel install --user --env VIRTUAL_ENV ../../.venv --name=opengeos_tools
~~~

Select the `opengeos_tools` kernel in JupyterLab.

## Model Weights

SAM model weights are downloaded automatically on first use:

| Variant | Size | Speed |
|---|---|---|
| `vit_h` | ~2.4 GB | Slowest, most accurate |
| `vit_l` | ~1.2 GB | Balanced |
| `vit_b` | ~370 MB | Fastest |

Weights are cached in `~/.cache/torch/hub/` after the first download.

## Notebooks

| Notebook | Topic |
|---|---|
| `samgeo/0-getting_started.ipynb` | Load SAM, basic prompted segmentation on a GeoTIFF |
| `samgeo/1-automatic_mask_generation.ipynb` | Automatic mask generation, quality tuning, GeoJSON/raster export |
| `samgeo/2-text_prompted_segmentation.ipynb` | Zero-shot segmentation with text prompts via LangSAM |
| `samgeo/3-batch_inference_geotiff.ipynb` | Tiled inference on large imagery, COG export |

## References

- Documentation: https://samgeo.gishub.org/
- GitHub: https://github.com/opengeos/segment-geospatial
- Paper: https://www.nature.com/articles/s41467-023-43473-8
