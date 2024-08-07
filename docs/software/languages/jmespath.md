# JMESPath

JMESPath was created for AWSCLI (`--query`) but has standalone
commandline versions as well as libraries for various languages.

> It is described in an ABNF grammar with a complete specification. This ensures that the language syntax is precisely defined.
>
> [https://jmespath.org/](https://jmespath.org/)

**Refs:**
- [Tutorial](https://jmespath.org/tutorial.html)

**Quoting is wierd:**

- Single quotes for literal strings.
- Backticks to introduce JSON (then double quotes inside).
- Double quotes are used to select named JSON elements.

[github issue#16](https://github.com/jmespath/jp/issues/16#issuecomment-456571273)

## Install

```shell
sudo wget https://github.com/jmespath/jp/releases/latest/download/jp-linux-amd64 \
  -O /usr/local/bin/jp  && sudo chmod +x /usr/local/bin/jp
```

## Syntax

**Negation**:  `"Instances[?!(Tags[?Key=='team'])]"`

## See also

- [Working with nested data (jmespath.org)](https://jmespath.org/examples.html#working-with-nested-data)