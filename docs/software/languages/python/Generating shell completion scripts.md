# Generating shell completion scripts

## Using shtab

shtab is a tool that generates static shell completion scripts from Python's argparse.

### In Python Code

```python
import shtab

# Add this to where you set up your parser
shtab.add_argument_to(parser)  # Adds --print-completion option

# Or generate directly:
shtab.complete(parser, shell="bash")  # or "zsh"
```

### From Command Line

```shell
shtab your_script.py > completion.sh
```

### Advantages over argcomplete

1. Generates true static completion scripts
2. Much faster completion since there's no Python process spawning
3. No runtime dependencies needed for the completions to work
