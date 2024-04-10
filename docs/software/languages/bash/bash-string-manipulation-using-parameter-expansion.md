---
alias: Bash string manipulation using parameter expansion
---
# Bash String manipulation using parameter expansion

Includes pattern removal, substitution, and case conversion.

| Operation                     | Description                                                                  | Example                                               | Result            |
| ----------------------------- | ---------------------------------------------------------------------------- | ----------------------------------------------------- | ----------------- |
| `${var#Pattern}`              | Remove shortest match of `Pattern` from the beginning of `$var`.             | `var='src_main.c'`<br>`echo ${var#*_}`                | `main.c`          |
| `${var##Pattern}`             | Remove longest match of `Pattern` from the beginning of `$var`.              | `var='src_inner_main.c'`<br>`echo ${var##*_}`         | `main.c`          |
| `${var%Pattern}`              | Remove shortest match of `Pattern` from the end of `$var`.                   | `var='src_main.c'`<br>`echo ${var%.*}`                | `src_main`        |
| `${var%%Pattern}`             | Remove longest match of `Pattern` from the end of `$var`.                    | `var='src.main.backup.tar'`<br>`echo ${var%%.*}`      | `src`             |
| `${var/Pattern/Replacement}`  | Replace first match of `Pattern` with `Replacement`.                         | `var='src_main.c'`<br>`echo ${var/_main/_test}`       | `src_test.c`      |
| `${var//Pattern/Replacement}` | Replace all matches of `Pattern` with `Replacement`.                         | `var='src_main_main.c'`<br>`echo ${var//_main/_test}` | `src_test_test.c` |
| `${var/#Pattern/Replacement}` | If `Pattern` matches the beginning of `$var`, replace it with `Replacement`. | `var='src_main.c'`<br>`echo ${var/#src/src_code}`     | `src_code_main.c` |
| `${var/%Pattern/Replacement}` | If `Pattern` matches the end of `$var`, replace it with `Replacement`.       | `var='src_main.c'`<br>`echo ${var/%.c/.h}`            | `src_main.h`      |
| `${var:Position}`             | Extract substring from `$var` starting at `Position`.                        | `var='src_main.c'`<br>`echo ${var:4}`                 | `main.c`          |
| `${var:Position:Length}`      | Extract `Length` characters of substring from `$var` starting at `Position`. | `var='src_main.c'`<br>`echo ${var:4:4}`               | `main`            |
| `${#var}`                     | Length of `$var`.                                                            | `var='src_main.c'`<br>`echo ${#var}`                  | `9`               |
| `${var^}`                     | Convert first character of `$var` to uppercase.                              | `var='src_main.c'`<br>`echo ${var^}`                  | `Src_main.c`      |
| `${var^^}`                    | Convert all characters of `$var` to uppercase.                               | `var='src_main.c'`<br>`echo ${var^^}`                 | `SRC_MAIN.C`      |
| `${var,}`                     | Convert first character of `$var` to lowercase.                              | `var='SRC_MAIN.C'`<br>`echo ${var,}`                  | `sRC_MAIN.C`      |
| `${var,,}`                    | Convert all characters of `$var` to lowercase.                               | `var='SRC_MAIN.C'`<br>`echo ${var,,}`                 | `src_main.c`      |
| `${v::-4}`                    | Remove last 4 chars from var                                                 | `var='src_main.c.bak'`<br>`echo $var::-4`<br>         | `src_main.c`      |