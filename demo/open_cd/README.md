# open_cd

Demonstrations for [Open-CD](https://github.com/likyoo/open-cd) — the most comprehensive open-source toolbox dedicated to **change detection** in remote sensing imagery.

Open-CD is built on the OpenMMLab ecosystem (mmengine, mmsegmentation, mmdet) and provides:
- 20+ state-of-the-art change detection models: ChangeFormer, BAN, TTP, FC-EF, SNUNet, LightCDNet, ...
- Binary change detection (what changed?)
- Semantic change detection (what changed to what?)
- Building damage assessment
- A unified config-based training and evaluation framework

## When to Use Open-CD

Use Open-CD when your task is explicitly about detecting **changes between two dates**:
- Building construction / demolition tracking
- Deforestation monitoring
- Disaster damage assessment (earthquakes, floods)
- Urban expansion mapping

For single-date segmentation, use TorchGeo + TerraTorch or GeoAI instead.

## Setup

> **Note**: Open-CD is not on PyPI. It is installed from GitHub via uv's git source mechanism.

~~~bash
cd demo/open_cd
uv sync --no-install-workspace
uv run ipython kernel install --user --env VIRTUAL_ENV ../../.venv --name=open_cd
~~~

Select the `open_cd` kernel in JupyterLab.

### GPU Acceleration for mmcv

By default, `mmcv` installs as a CPU-only wheel. For GPU acceleration, replace it with the CUDA wheel after syncing:

~~~bash
uv run pip install mmcv -f https://download.openmmlab.com/mmcv/dist/cu118/torch2.1/index.html
~~~

The `0-intro_and_install.ipynb` notebook detects your CUDA version and prints the exact command.

## Notebooks

| Notebook | Topic |
|---|---|
| `open_cd/0-intro_and_install.ipynb` | OpenMMLab overview, verify install, GPU mmcv setup |
| `open_cd/1-levir_cd_dataset.ipynb` | LEVIR-CD dataset, bitemporal format, visualization |
| `open_cd/2-changer_training.ipynb` | Config-based Changer training, TensorBoard logging |
| `open_cd/3-inference_and_visualization.ipynb` | Checkpoint loading, inference, F1/IoU evaluation |

## References

- GitHub: https://github.com/likyoo/open-cd
- Paper: https://arxiv.org/abs/2407.15317
- LEVIR-CD dataset: https://chenhao.in/LEVIR/
- OpenMMLab: https://openmmlab.com/
