---
author: mbailey
comments: true
date: 2010-10-25 06:07:23+00:00

slug: the-long-tail
title: The Long Tail
wordpress_id: 63
---

One of the questions in a technical interview I sat today was "Write 'tail' in
Ruby". I had a pen and paper and no access to Google. I think I came up with a
reasonable solution *but* I realised how dependent I am on docs! It took me a
long time to arrive at a solution when I couldn't refer to Ruby API docs.

```ruby
#!/usr/bin/env ruby

filename = ARGV[0]

end_marker = 0
offset_increment = 1000

lines = []
fh = File.open filename
while lines.size < 10
  current_offset = end_marker + offset_increment
  fh.seek(-current_offset, IO::SEEK_END) || fh.rewind
  buf = fh.read(current_offset - end_marker).split("\n")
  lines.insert(0, *buf)
  end_marker += current_offset
end
puts lines.last 10
```

Hmm, it's still kinda broken.
