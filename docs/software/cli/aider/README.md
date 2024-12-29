---
alias: Aider - AI Coding Assistant
---
# Aider

- [paul-gauthier/aider (github.com)](https://github.com/paul-gauthier/aider): Aider is AI pair programming in your terminal

- [TODO](TODO.md)
- [voice](voice.md)
- Pipecat

## Usage

`aider`
    `--architect`: Discuss changes before sending instructions to coder.
    `--subtree-only`: Only consider files in the current subtree of the git
    `--restore-chat-history`: Pick up where you left off.

I tend to use architect mode:

```shell
alias aa='aider --architect --sonnet --editor-model sonnet'
```

### Commands

*Note: You can use short commands (e.g. `/ch ask`)*

| Command    | Description                                        | Arguments                       |
| ---------- | -------------------------------------------------- | ------------------------------- |
| /settings  | List all settings                                  | None                            |
| /paste     | Add clipboard image to chat                        | Image file path                 |
| /run or !  | Run a shell command                                | Command to execute              |
| /ask       | Ask questions about code without edits             | Question text                   |
| /chat-mode | Switch chat modes                                  | Mode (`ask`, `code`, or `help`) |
| Ctrl-Z     | Suspend Aider for terminal access (`fg` to resume) |                                 |

## Investigate

- [prompt-caching](prompt-caching.md)
- Aiderignore file
- browser feature
- [Chat History](Chat%20History.md)

## Install


### Linux

```shell
$ pip install aider-chat

# Change directory into a git repo
$ cd /to/your/git/repo

# Work with Claude 3.5 Sonnet on your repo
$ export ANTHROPIC_API_KEY=your-key-goes-here
$ aider

# Work with GPT-4o on your repo
$ export OPENAI_API_KEY=your-key-goes-here
$ aider 
```

### macOS

```shell
# Ensure pipx is installed
brew install pipx
pipx ensurepath
source ~/.bashrc

# Install aider-chat
brew install python-tk python-setuptools
pipx install aider-chat
```

## Configure

```shell
read:
  - /home/m/CONVENTIONS.md
  - CONVENTIONS.md
```


## Log

2024-11-05 12:35:37 +11:00 Tue

- TIL RSS reader can get ATOM feed: from https://github.com/Aider-AI/aider/releases