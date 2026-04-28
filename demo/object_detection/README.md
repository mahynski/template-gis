# object_detection

Demonstrations for two complementary object detection tools for georeferenced imagery:

- **[SAHI](https://github.com/obss/sahi)** — Slicing Aided Hyper Inference: improves detection of small objects in large images by tiling and merging predictions from any YOLO or DETR detector.
- **[GeoDeep](https://github.com/uav4geo/GeoDeep)** — Minimal ONNX-based detection on GeoTIFFs. Ships pre-built models for cars, buildings, and trees; requires only `rasterio` + `onnxruntime`.

Both libraries share this environment since their dependencies are compatible.

## Setup

~~~bash
cd demo/object_detection
uv sync --no-install-workspace
uv run ipython kernel install --user --env VIRTUAL_ENV ../../.venv --name=object_detection
~~~

Select the `object_detection` kernel in JupyterLab.

## Notes

- `opencv-python-headless` is used instead of `opencv-python` to avoid the `libgl1` system dependency in headless container environments.
- YOLO model weights are downloaded automatically by Ultralytics on first use (~6 MB for YOLOv8n).
- GeoDeep ONNX models are downloaded automatically from the GeoDeep model hub on first use.

## Notebooks

### SAHI

| Notebook | Topic |
|---|---|
| `sahi/0-sliced_inference_intro.ipynb` | Core concept, wrapping YOLO, sliced vs standard prediction |
| `sahi/1-small_object_detection.ipynb` | Tuning slice/overlap for aerial scenes, COCO JSON export |
| `sahi/2-coco_utilities.ipynb` | Dataset slicing, COCO evaluation, YOLO format conversion |

### GeoDeep

| Notebook | Topic |
|---|---|
| `geodeep/0-getting_started.ipynb` | Built-in models (cars, buildings), output GeoJSON schema |
| `geodeep/1-building_detection.ipynb` | End-to-end detection, footprint visualization, statistics |
| `geodeep/2-custom_onnx_model.ipynb` | Using a custom ONNX model; PyTorch → ONNX export |

## References

- SAHI GitHub: https://github.com/obss/sahi
- SAHI paper: https://ieeexplore.ieee.org/document/9897990
- GeoDeep GitHub: https://github.com/uav4geo/GeoDeep
