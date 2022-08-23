## Endianness (*Elliot's brother* 😉)

- The term `big-endian` is expressed in little-endian
- The term `little-endian` is also expressed in little-endian

> In [computing](https://en.wikipedia.org/wiki/Computing "Computing"), **endianness** is the order or sequence of [bytes](https://en.wikipedia.org/wiki/Byte "Byte") of a [word](https://en.wikipedia.org/wiki/Word_(data_type) "Word (data type)") of digital data in [computer memory](https://en.wikipedia.org/wiki/Computer_memory "Computer memory"). Endianness is primarily expressed as **big-endian** (**BE**) or **little-endian** (**LE**). A big-endian system stores the [most significant byte](https://en.wikipedia.org/wiki/Most_significant_byte "Most significant byte") of a word at the smallest [memory address](https://en.wikipedia.org/wiki/Memory_address "Memory address") and the [least significant byte](https://en.wikipedia.org/wiki/Least_significant_byte "Least significant byte") at the largest. A little-endian system, in contrast, stores the least-significant byte at the smallest address.
> 
> [Endianness - Wikipedia](https://en.wikipedia.org/wiki/Endianness)

### big-endian (Mike's preference):

I describe this as "the wagging tail of the dog on the right". The thing that changes least in a set of things will group them when ordering alphabetically. This is useful when listing files (or any string) by name and helps with tab completion.

- Filenames:   e.g.  `2022-08-24-example-file.txt`  # Sorting by filename sorts by date
- Command line tool names (file/function): e.g. `instance-terminate` # noun-verb naming allows for tab completion for actions that can be performed on an object

[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) expresses dates/times in big endian formats.

