# Git Image Minification

Keep repos from growing due to unnecessarily large images.

## Apply lossy compression to PNGs on commit

- Depends on [`pngquant`](https://pngquant.org/) binary.
- Commit will fail if command fails (you can turn this off)

Update [Git attributes](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_git_attributes) in this repo to tell git to apply a Git Filter on PNG files before `commit` and `diff`.

```shell
$ echo "*.png diff=exif filter=pngquant" >> .gitattributes
$
```

Set [Git "clean/smudge" filters](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#filters_b) in your checked out repo tell Git what command to run.

```shell

git config filter.pngquant.required true 
git config filter.pngquant.clean "pngquant --speed 1 --strip -"
git config filter.pngquant.smudge cat
```

Set [Git "diff"](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_diffing_binary_files) in your checked out repo tell Git what command to run.

```shell
git config diff.exif.textconv exiftool 
```

These commands should have updated `.git/config` to include the following:

```
[filter "pngquant"]
  required
  clean = pngquant --speed 1 -
  smudge = cat
[diff "exif"]
  textconv = exiftool -
```
