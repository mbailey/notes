# Darkman


A framework for dark-mode and light-mode transitions on Unix-like desktops.

- https://gitlab.com/WhyNotHugo/darkman/

At sundown, it will look for scripts in $XDG_DATA_DIRS/dark-mode.d/.
At sunrise, it will look for scripts in $XDG_DATA_DIRS/light-mode.d/.

## Install
```
sudo dnf -y install darkman
```

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
alias dark="gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'"
alias light="gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'"
```

**Optional**:
```
/home/m/.config/darkman/config.yaml
```



## Enable
```
systemctl --user enable --now darkman.service
```



