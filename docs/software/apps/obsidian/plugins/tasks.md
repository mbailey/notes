---
alias: Tasks - Obsidian plugin
---
# Tasks - Obsidian plugin

- [Quick Reference (obsidian-tasks-group.github.io)](https://obsidian-tasks-group.github.io/obsidian-tasks/quick-reference/)
- [Introduction (obsidian-tasks-group.github.io)](https://obsidian-tasks-group.github.io/obsidian-tasks/)
- (not) [My Task Management System (forum.obsidian.md)](https://forum.obsidian.md/t/my-task-management-system/36198)

- https://youtu.be/quXNtjTe5WE?si=i5VSyCGTAW0dePyN

Combining Filters:
```
```tasks
not done
(path includes shopping/hardware) OR (tags includes #hardware)
```

## Naming of Things

- every task should have a project or bau assigned, either by being under a projetc or by having its take assigned
- a project is a bit like a costcode - it provides context




## Hotkeys

- CTRL-SHIFT-T: Create or edit task
- CTRL-L: Toggle Task/Checkbox Done

## Cleanup `- [ ]` in files

I decided against ising `#task` tag and needed to cleanup >2000 `- [ ]` checkboxes in my notes.

```shell
grep -cr '\- \[ \]'  | grep -v ':0$' | sort -nk 2 -t':'
```


## Example Queries in Daily Note Tasks

>-   Any task that requires more than one action to complete is a project. Each project is a note in my Obsidian vault, and the tasks related to that project sit in that note.
>-   Recurring tasks also each have their own note. This enables me to list all my recurring tasks via Dataview, and has the further advantage that I can see the history of when I completed each recurring task.
>-   A one-off task can go into any note to which it relates, but most often that is a project note or my Daily Note.
>-   Every task is either ‘planned’ or ‘unplanned’. If it is unplanned, it does not use the Tasks plugin functionality at all, and is just a checkbox. I can review all my unplanned tasks using a Dataview query and see which need to be planned. Planned tasks use the power of the Tasks plugin to determine when they start (are available from), are scheduled, or are due.
>-   My Daily Note uses Tasks queries to show which tasks are due, scheduled or available today - as well as those completed today.
>
> - [My Task Management System (forum.obsidian.md)](https://forum.obsidian.md/t/my-task-management-system/36198)

![](../assets/example-obsidian-tasks-summary.png)


## Break vim less

Set `Minimum match length for auto-suggest` above `0` to enable vim command like `dd` to work on task items.

![](../assets/Pasted%20image%2020230327122857.png)