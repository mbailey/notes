---
alias: BATS testing framework
---
# BATS testing framework

- [Tutorial — bats-core 1 documentation (bats-core.readthedocs.io)](https://bats-core.readthedocs.io/en/stable/tutorial.html#)
- [Conventions](conventions.md)
## Install in project

```shell
git submodule add https://github.com/bats-core/bats-core.git tests/bats
git submodule add https://github.com/bats-core/bats-support.git tests/test_helper/bats-support
git submodule add https://github.com/bats-core/bats-assert.git tests/test_helper/bats-assert
```


## Usage

### `run`:

- returns 0
- stores stdout/stderr in `$output`
- stores the exit code in `$status` and returns 0

### `setup()`

- Run before each test.

### `setup_file()`

- Run before each file.

### `teardown()`

> A test ends at its first failure. None of the subsequent commands in this test will be executed. The teardown function runs after each individual test in a file, regardless of test success or failure. Similarly to setup, each .bats file can have its own teardown function which will be the same for all tests in the file.

### `teardown()`

Run after each file.
### `skip`

Skip a test and provide explanatory message:

```shell
@test "Show welcome message on first invocation" {
    if [[ -e /tmp/bats-tutorial-project-ran ]]; then
        skip 'The FIRST_RUN_FILE already exists'
    fi
```