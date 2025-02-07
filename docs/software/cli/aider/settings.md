# Aider Configuration

Set options with:

- environment variable: `AIDER_DARK_MODE`
- .env file: `AIDER_DARK_MODE`
- .aider.conf.yml: `dark-mode: true`
- Command line switch: `--dark-mode`.

Aider has many options which can be set with command line switches.
Most options can also be set in an `.aider.conf.yml` file which can be placed in your home directory or at the root of your git repo. 
Or by setting environment variables like `AIDER_xxx` either in your shell or a `.env` file.

Here are 4 equivalent ways of setting an option. 

With a command line switch:

```
$ aider --dark-mode
```

Using a `.aider.conf.yml` file:

```yaml
dark-mode: true
```

By setting an environment variable:

```
export AIDER_DARK_MODE=true
```

Using an `.env` file:

```
AIDER_DARK_MODE=true
```
