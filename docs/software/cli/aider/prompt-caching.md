# Prompt caching

Aider supports prompt caching for cost savings and faster coding. Currently Anthropic provides caching for Sonnet and Haiku, and DeepSeek provides caching for Coder.

```shell
--cache-prompts --no-stream --cache-keepalive-pings 2
```

## Usage

Run aider with `--cache-prompts` or add that setting to your [configuration files](https://aider.chat/docs/config.html).

Due to limitations in the provider APIs, caching statistics and costs are not available when streaming responses. To turn off streaming, use `--no-stream`.

When caching is enabled, it will be noted for the main model when aider launches:

```
Main model: claude-3-5-sonnet-20240620 with diff edit format, prompt cache, infinite output
```

## Preventing cache expiration

Aider can ping the provider to keep your prompt cache warm and prevent it from expiring. By default, Anthropic keeps your cache for 5 minutes. Use `--cache-keepalive-pings N` to tell aider to ping every 5 minutes to keep the cache warm. Aider will ping up to `N` times over a period of `N*5` minutes after each message you send.

## See also

- [Prompt caching  aider (aider.chat)](https://aider.chat/docs/usage/caching.html)