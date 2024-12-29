# Conda

Cross platform package management using .envrionment.yml file.

## Usage

### Config

Don't load automatically on login:`

```shell
conda config --set auto_activate_base false
```

Export env:
```shell
conda env export > environment.yml
```

Create env:
```
conda env create -f environment.yml
```

## Install

```
sudo dnf install -y conda
```