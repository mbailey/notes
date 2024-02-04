# Git Image Minification

Keep repos from growing due to unnecessarily large images.

**Note: I'm using pre-commit hooks instead to minify images now [4 Feb 2024].**

## PNGs

Apply lossy compression when PNG is commit commited to index from work tree.

- Depends on [`pngquant`](https://pngquant.org/) binary.
- Commit will fail if command fails (you can turn this off by setting `required false`)

Update [Git attributes](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_git_attributes) in this repo to tell git to apply a Git Filter on PNG files before `commit` and `diff`:

```shell
echo "*.png filter=pngquant" >> ~/.gitattributes
```

Set [Git "clean/smudge" filters](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#filters_b) in your checked out repo tell Git what command to run.
*Leave out `--global` to apply filter to current repo only.*

```shell
git config --global filter.pngquant.required true 
git config --global filter.pngquant.clean "pngquant --speed 1 --strip -"
git config --global filter.pngquant.smudge cat
```

## Resize JPEGs on commit

Resize JPEG image to maximum width of 1920 pixels (only if wider) when commited to index from work tree.

- [ ] Should we update image in work tree? #TODO

- Depends on `convert` binary (part of ImageMagick)
- Commit will fail if command fails (you can turn this off by setting `required false`)

Update [Git attributes](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_git_attributes) in this repo to tell git to apply a Git Filter on JPEG files before `commit` and `diff`:

```shell
echo "*.jpg filter=jpeg-resize" >> ~/.gitattributes
echo "*.jpeg filter=jpeg-resize" >> ~/.gitattributes
```

Set [Git "clean/smudge" filters](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#filters_b) in your checked out repo tell Git what command to run.
*Leave out `--global` to apply filter to current repo only.*

```shell
git config --global filter.jpeg-resize.required true 
git config --global filter.jpeg-resize.clean "convert jpg:- -resize '1920>' -auto-orient -strip jpg:-"
git config --global filter.jpeg-resize.smudge cat
```

## Measure the Impact

### Simple atomic script to test your settings

```shell
function image-minify-test() {
    TMPDIR=$(mktemp -d -p .)
    [[ -z $TMPDIR ]] && echo "Error: Failed to create tempdir" && return 1
    cd $TMPDIR
    wget https://upload.wikimedia.org/wikipedia/commons/3/3f/JPEG_example_flower.jpg
    wget https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Example_png.png/640px-Example_png.png
    du -sh .
    git init .
    git config --local user.email "test"
    git config --local user.name "Test"
    git config --local commit.gpgsign false
    echo "*.png filter=pngquant" >> .gitattributes
    echo "*.jpg filter=jpeg-resize" >> .gitattributes
    echo "*.jpeg filter=jpeg-resize" >> .gitattributes
    git add .
    git commit -m 'Add images to check filesize reduction'
    du -sh .git
}
```

### How much would your current settings reduce all images in a dir tree?

List all related images:

```shell
# Create some tools (DSL - Domain Specific Language)

function find-image() {
  find $1 -regex  '.*\.\(jpeg\|jpg\|png\)'
}

alias count='wc -l'
```

Copy all the images to a new dir:

```shell
$ find-images | count
241
$ mkdir image-copy
$ find-images | grep -v image-copy | xargs -i cp '{}' --parents  image-copy
$ find-images image-copy | count
241
$ du -sb image-copy
38861938        image-copy
$ du -sh image-copy
38M     image-copy
```

Add them to new temporary local git repo:

```shell
cd image-copy
git init .
echo "*.png filter=pngquant" >> .gitattributes
echo "*.jpg filter=jpeg-resize" >> .gitattributes
echo "*.jpeg filter=jpeg-resize" >> .gitattributes
git add .
git commit .
```

Check size of images in git index:

```shell
$ du -sk .git 
# 14060   .git
```
