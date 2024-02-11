---
alias: Jupyter Notebooks
---
# Jupyter Notebooks

Free software, open standards, and web services for interactive computing across all programming languages

## Install

```
sudo dnf install -y \
  python3-nbformat \
  python3-nbconvert
```

## Tools

- [Jupyter Interactive Notebook (github.com)](https://github.com/jupyter/notebook)
- **JupyterLab**: [computational environment. (github.com)](https://github.com/jupyterlab/jupyterlab)
- [Multi-user server for Jupyter notebooks (github.com)](https://github.com/jupyterhub/jupyterhub)
- [nbviewer (nbviewer.org)](https://nbviewer.org/): Renders static HTML web page ([nbconvert](nbconvert.md)) from Jupyter Notebook file URL.
- [Binder (mybinder.org)](https://mybinder.org/): executable environment for Jupyter notebooks.
    - [Mining the social web (mybinder.org)](https://mybinder.org/v2/gh/mikhailklassen/Mining-the-Social-Web-3rd-Edition/master)
- [jupyter/nbdime(github.com)](https://github.com/jupyter/nbdime):  Tools for diffing and merging of Jupyter notebooks. 

## Commands

- **[nbconvert](nbconvert.md)**: convert a Jupyter notebook to various formats, including markdown

## Project layout

- [Building a Repeatable Data Analysis Process with Jupyter Notebooks - Practical Business Python (pbpython.com)](https://pbpython.com/notebook-process.html)

notebooks
- retri
### /notebooks

### /data
There are no strict standards for the top-level directories under the `/data` directory, but a common and effective approach is to organize them based on the data's stage in your workflow. For instance:

1. `/raw`: Contains the raw, unprocessed data as it was originally acquired.

2. `/processed`: Holds data that has been cleaned, transformed, or otherwise processed for analysis.

3. `/external`: For data sourced from outside your organization, like third-party APIs.

4. `/interim`: Temporary storage for data that is in the process of being cleaned or transformed.

This structure helps in maintaining clarity about the state and source of your data at any point in your project.A

## See also

- [conda](conda.md): Popular package manager among Jupyter users