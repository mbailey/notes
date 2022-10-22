# Git Image Minification

Keep repos from growing due to unnecessarily large images.

## PNGs

Apply lossy compression when PNG is commit commited to index from work tree.

- Depends on [`pngquant`](https://pngquant.org/) binary.
- Commit will fail if command fails (you can turn this off)

Update [Git attributes](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_git_attributes) in this repo to tell git to apply a Git Filter on PNG files before `commit` and `diff`:

```shell
echo "*.png diff=exif filter=pngquant" >> .gitattributes
```

Set [Git "clean/smudge" filters](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#filters_b) in your checked out repo tell Git what command to run.
*Leave out `--global` to apply filter to current repo only.*

```shell
git config --global filter.pngquant.required true 
git config --global filter.pngquant.clean "pngquant --speed 1 --strip -"
git config --global filter.pngquant.smudge cat
```

~~Set [Git "diff"](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_diffing_binary_files) in your checked out repo tell Git what command to run.

- [ ] Work out how to avoid Git thinking file has changed when it hasn't #TODO
~~git config diff.exif.textconv exiftool ~~

## Resize JPEGs on commit

Resize JPEG image to maximum width of 1920 pixels (only if wider) when commited to index from work tree.

- [ ] Work out how to update image in work tree #TODO

- Depends on `convert` binary (part of ImageMagick)

Update [Git attributes](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_git_attributes) in this repo to tell git to apply a Git Filter on PNG files before `commit` and `diff`:

```shell
echo "*.jpg diff=exif filter=resize-jpg" >> .gitattributes
echo "*.jpeg diff=exif filter=resize-jpg" >> .gitattributes
```

Set [Git "clean/smudge" filters](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#filters_b) in your checked out repo tell Git what command to run.
*Leave out `--global` to apply filter to current repo only.*

```shell
git config --global filter.resize-jpeg.required true 
git config --global filter.resize-jpeg.clean "convert jpg:- -resize '1920>' -auto-orient -strip jpg:-"
git config --global filter.resize-jpeg.smudge cat
```

~~Set [Git "diff"](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_diffing_binary_files) in your checked out repo tell Git what command to run.~~

- [ ] Work out how to avoid Git thinking file has changed when it hasn't #TODO
~~git config diff.exif.textconv exiftool ~~
