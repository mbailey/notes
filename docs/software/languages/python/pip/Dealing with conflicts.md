# Dealing with conflicts in python pip

Installation of python packages sometimes fails because AI TO COMPLETE SENTENCE.

## Problem

Sometimes when installing a python package with pip:

```shell
$ pip install --upgrade aider-chat
```


We get an error based on dependencies:

```shell
ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
cached-path 1.6.4 requires filelock<3.14,>=3.4, but you have filelock 3.16.1 which is incompatible.
datasets 3.1.0 requires fsspec[http]<=2024.9.0,>=2023.1.0, but you have fsspec 2024.10.0 which is incompatible.
docling 2.5.2 requires scipy<2.0.0,>=1.14.1, but you have scipy 1.13.1 which is incompatible.
gradio 5.6.0 requires fastapi<1.0,>=0.115.2, but you have fastapi 0.111.1 which is incompatible.
gradio 5.6.0 requires markupsafe~=2.0, but you have markupsafe 3.0.2 which is incompatible.
gradio 5.6.0 requires python-multipart==0.0.12, but you have python-multipart 0.0.9 which is incompatible.
gradio 5.6.0 requires starlette<1.0,>=0.40.0; sys_platform != "emscripten", but you have starlette 0.37.2 which is incompatible.
transformers 4.46.3 requires tokenizers<0.21,>=0.20, but you have tokenizers 0.19.1 which is incompatible.
```

## Solutions

- Use [pipx](../pipx.md)