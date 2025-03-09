---
author: Mike Bailey
comments: true
date: 2007-07-06 03:32:10+00:00

slug: pretty-code-samples-in-presentations
title: Pretty Code Samples in Presentations
wordpress_id: 33
categories:
- presentations
---

Today is [deprec](http://www.deprec.org/) day (well, the start of a deprec long weekend actually!).

I started the day with some procrastination. I decided to learn how to make
super awesome eyecandy ruby slides in Keynote. I love presentations that
include code samples and want to be able to make mine look good with as little
effort as possible.

First I installed a Textmate bundle called [Copy as 	RTF](http://synaphy.com.au/2007/6/21/copy-as-rtf-bundle-for-textmate) that copies a selection to the clipboard while preserving syntax highlighting and optimizing font size for pasting into Keynote.

Then I found the [ultimate pretty
font](http://www.hamptoncatlin.com/assets/2007/5/21/make_resourceful.pdf)
(slides 14 + 15) but can't work out it is. I tried all the fonts on my
MacBookPro to no avail. Then it occurred to me that I want a fixed width font
to display code. And my Mac has only four of them: **Monaco** (which is the
default for textmate), **Courier**, **Courier new** and **Andale Mono**.

[![](../../images/2007-07-06-pretty-code-samples-in-presentations/make_resourceful_slide-1024x349.jpg)](../../images/2007-07-06-pretty-code-samples-in-presentations/make_resourceful_slide.jpg)

So what font have they used?

**update - I found the font!**
It's Sunday night and I decided to have another crack at matching the font.
Adobe Reader lists the fonts used under 'Document Properties'. There's a
Textmate page listing [alternative
fonts](http://macromates.com/wiki/Main/AlternativeFonts). Guess what?
BitstreamVeraSans and DejaVuSans are listed in both the document properties and
the list of free fonts! I installed both and I reckon the winner is
[DejaVuSans-mono
(](http://dejavu.sourceforge.net/wiki/index.php/Main_Page)[download](http://dejavu.sourceforge.net/wiki/index.php/Download)).

I got my Apple MacBookPro using this font by copying it to /System/Library/Fonts.

**update 2**
I had a problem with CopyasRTF. When pasting onto a black background in
Keynote, all white text is turned black. I managed to fix this by changing the
default color_index to 45 (from 0) as shown below.

    unless new_style[:color_index]
      new_style[:color_index] = 45
    end
