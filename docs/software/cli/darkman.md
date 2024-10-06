# Darkman


A framework for dark-mode and light-mode transitions on Unix-like desktops.

- https://gitlab.com/WhyNotHugo/darkman/

At sundown, it will look for scripts in $XDG_DATA_DIRS/dark-mode.d/.
At sunrise, it will look for scripts in $XDG_DATA_DIRS/light-mode.d/.

## Install

### Fedora

```
sudo dnf -y install darkman
```

### Ubuntu

```shell
sudo apt install -y golang scdoc
git clone https://gitlab.com/WhyNotHugo/darkman.git
cd darkman
make
sudo make install PREFIX=/usr
```

## Setup


## Configure

Enable location services (Gnome Settings on fedora)

**Scripts to run for light and dark**

- example files in the [repo](https://gitlab.com/WhyNotHugo/darkman/-/tree/main/examples)
- Can be saved in any `$XDG_DATA_DIRS`

```
~/.local/share/dark-mode.d/
~/.local/share/light-mode.d/
```
- Scripts  must be executable

**Example dark for Gnome**:

```
alias dark="darkman set dark"
alias light="darkman set light"
```

### Config (optional)

```
${HOME}/.config/darkman/config.yaml
```
### [Custom executables](https://darkman.whynothugo.nl/#Custom_executables)

For additional application support, custom executables (including simple shell scripts) can be placed in the following two directories:

•_$XDG_DATA_DIRS/dark-mode.d/_: Scripts to run when switching to dark mode.

•_$XDG_DATA_DIRS/light-mode.d/_: Scripts to run when switching to light mode.


## Enable
```
systemctl --user enable --now darkman.service
```


## Disable

```shell
systemctl --user disable --now darkman
```
