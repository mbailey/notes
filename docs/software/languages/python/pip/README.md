---
alias: Python pip
---
# Python pip

Installs python packages from [PyPI](pypi.md).

- [Dealing with conflicts](pip/Dealing%20with%20conflicts.md)

## Commands


**Install in editable mode:** `pip install -e .`
**Identify what depends on a package:** `pip aws awscli | grep "Required-by"`




## Generate requirements.txt

You can use tools like pipreqs or pip-tools to analyze your Python files and generate a requirements.txt  file.                                                                                                                     
For pipreqs:                                                                                                              

```shell
pip install pipreqs
pipreqs /path/to/your/project
```

This will create a requirements.txt file in your project root.  


## See also

- [pipx](pipx.md)