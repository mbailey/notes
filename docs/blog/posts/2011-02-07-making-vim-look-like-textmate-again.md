---
author: Mike Bailey
comments: true
date: 2011-02-07 12:53:00+00:00

slug: making-vim-look-like-textmate-again
title: Making vim look like textmate (again!)
wordpress_id: 82
categories:
- axe sharpening
---

A few years ago I posted about my quest to make editing ruby in my terminal as
beautiful as in Textmate. I've been back on linux for a year now but it's only
tonight I've gotten around to sorting out my vim display.

[RedCar](http://redcareditor.com/), an open source cross platform alternative
to [TextMate](http://macromates.com/), reminded me how pretty code can look.
Tonight I worked out how to make vim on ubuntu lucid look just as lovely.

1. Grab the [twilight256 colorscheme](http://www.vim.org/scripts/script.php?script_id=3436) and drop it into ~/.vim/colors/twilight256.vim
1. Make sure you're using 256 color terminal (I put this in ~/.bashrc) ```export TERM=xterm-256color```
1. Tell vim to use this colorscheme (I put it in ~/.vimrc) ```colorscheme twilight256```
1. In my terminal under "Edit" -> "Profile Preferences" I selected "Deja Vu Sans Mono Book" "13"

I can't believe it took me so long to do this but I'm glad I finally have.

{% 
  include figure
  image_path="/images/2011-02-07-making-vim-look-like-textmate-again/good_looking_vim1.png"
  caption="Ruby can look pretty under Vim on Linux"
%}
