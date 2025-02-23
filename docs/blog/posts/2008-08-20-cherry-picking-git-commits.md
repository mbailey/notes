---
author: mbailey
comments: true
date: 2008-08-20 14:27:57+00:00

slug: cherry-picking-git-commits
title: cherry picking git commits
wordpress_id: 25
categories:
- deprec
- development
- git
---

I've been a little bit slow to learn [git](http://git-scm.com/). I put that
down to it being my fourth version control system (after rcs, cvs and svn).
Like a fourth child[1] it brought with it less novelty and I've got less free
time to get to know it. That being said, git is a revolutionary advance over
subversion and is worth committing the effort to learn.

A little while ago I imported my deployment library
'[deprec](http://www.deprec.org/)' to [github](https://github.com/). This week
I discovered [a feature](http://github.com/mbailey/deprec/network) that shows
me what changes other open source developers have been making on their forks of
the deprec codebase.

[![Github network feature](/images/2008-08-20-cherry-picking-git-commits/github_network11.jpg)](/images/wp/2008/08/github_network11.jpg)

Clicking on that link shows us [a diff for that
commit](http://github.com/andyh/deprec/commit/3c089da563bd2b4a7a2af662a56b7bc4d9845a7f)
and today [Pete Yandell ](http://notahat.com/)was kind enough to show me how to
cherry pick a commit and apply it to my repository.

```bash
#First we create a branch and pull thewoolleyman's code into it
git checkout -b thewoolleyman
git remote add thewoolleyman git://github.com/thewoolleyman/deprec.git
git pull thewoolleyman master

# Next we find a commit that interests us
# I chose 09dca130c2826339f3cacff937acee4ef26c6d6c
git log

# Compare this changeset with the previous version
# Note that you can use github for this and the previous step.
diff 09dca130c2826339f3cacff937acee4ef26c6d6c 09dca130c2826339f3cacff937acee4ef26c6d6c^

# Change back to our master branch
git checkout master
git cherry-pick 09dca130c2826339f3cacff937acee4ef26c6d6c

# Push the changes to our remote repo (in this case - github)
git push
```

I'm pretty excited at how simple it is to see what other people have done with my code and merge it into deprec. Github have provided a feature that I think will really aid in the development of open source. Well done guys!

[1] I don't have kids (yet) but if and when I do I hope they realize this was said in jest!
