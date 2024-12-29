# GNU Readline: The Hidden Hero of Your Terminal 🦸

Readline is widely used but less widely understood.

## Most Used Readline Commands

| Function Name              | Shortcut | Description                         | 💭                               |
| -------------------------- | -------- | ----------------------------------- | -------------------------------- |
| 🔍 reverse-search-history  | Ctrl-R   | Search command history backwards    | The ultimate history finder      |
| ⬅️ beginning-of-line       | Ctrl-A   | Move to start of line               | Faster than holding left arrow   |
| ➡️ end-of-line             | Ctrl-E   | Move to end of line                 | Better than mashing right arrow  |
| 🦘 forward-word            | Alt-F    | Move forward one word               | Like Ctrl-Right in editors       |
| 🦘 backward-word           | Alt-B    | Move backward one word              | Like Ctrl-Left in editors        |
| ✂️ unix-word-rubout        | Ctrl-W   | Delete word before cursor           | Quicker than backspace           |
| 🗑️ kill-line              | Ctrl-K   | Kill text from cursor to end        | Perfect for rewriting commands   |
| 📋 yank                    | Ctrl-Y   | Yank previously killed text         | Paste what you just cut          |
| 🧹 clear-screen            | Ctrl-L   | Clear screen                        | Cleaner than typing 'clear'      |
| 🌟 yank-last-arg           | Alt-.    | Insert last arg of previous command | Great for operating on same file |
| ↩️ undo                    | Ctrl-_   | Undo                                | Everyone needs an undo!          |
| 📝 insert-comment          | Alt-#    | Comment line & move to new line     | Save that command for later      |
| 🔄 exchange-point-and-mark | Ctrl-XX  | Toggle between start & cursor       | Great for adding sudo            |
| 🎯 character-search        | Ctrl-] x | Move to next character 'x'          | Quick character navigation       |
| 📜 beginning-of-history    | Alt-<    | Move to first command in history    | Jump to the beginning            |
| 📜 end-of-history          | Alt->    | Move to last command in history     | Back to the present              |

## Pro Tips 🎓

- These function names are what you'll see in the output of `bind -p`
- Use them in your `.inputrc` for custom bindings
- They're consistent across readline-using applications
- Many have both emacs and vi mode equivalents

## Notes

```
$ llm cmd "gnu readline: delete from cursor to end of lines"
> bind-key -x '"\C-k": kill-line'
```