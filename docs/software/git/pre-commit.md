# pre-commit


- https://pre-commit.com/

## Setup the git hook scripts

    pre-commit install

## Usage

**Run manually**:
```shell
pre-commit run --all-files
```


**Output from failing git commit**:
```
> git -c user.useConfigOnly=true commit --quiet --allow-empty-message --file - -S
check for added large files..............................................Passed
Markdown Link Check......................................................Failed
- hook id: markdown-link-check
- exit code: 1

ERROR: 1 dead links found in personal/Daily/2024-01/2024-01-30-Tue.md !
  [✖] ../tasks/summary.md → Status: 400
```
