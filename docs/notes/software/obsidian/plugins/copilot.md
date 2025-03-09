---
alias: Obsidian Copilot
---
# Obsidian Copilot - Obsidian Plugin

## Local Ollama

- [Local Copilot Setup Guide (github.com)](https://github.com/logancyang/obsidian-copilot/blob/master/local_copilot.md)

### Setting Ollama context window

need to manually set it after running model(???)

> AFAIK `ollama serve` doesn't have a consolidated way to configure context window for all the models at a single place. The current best way is to run `ollama run <modelname>` and then `/set parameter num_ctx 32768` (this is the max for Mistral, set it based on your model requirement), and don't forget to `/save <modelname>` for each model individually.
>
> Remember that you MUST set this parameter for Ollama models, or they will silently fail and you will think your long prompt successfully reached the model!
> 
>- [important note](https://github.com/logancyang/obsidian-copilot/blob/master/local_copilot.md#important-note-about-setting-context-window)


## Ollama for Local Embeddings
 
- [Ollama for local embeddings](https://github.com/logancyang/obsidian-copilot/blob/master/local_copilot.md#ollama-for-local-embeddings)

Ollama has added support for local embeddings for RAG since v0.1.26! It's super easy to setup, just run

```
ollama pull nomic-embed-text
```

and start your local Ollama server as before. Now you can set your embedding model in Copilot settings as `ollama-nomic-embed-text`, and it will use your local embeddings!

With this one Ollama server running, you can set your Chat model as Ollama too, meaning it handles both chat streaming and embedding! You can then have a **completely offline QA** experience!

#### Now, go crazy with local models in Chat mode and QA modes!