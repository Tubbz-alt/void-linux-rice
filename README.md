## README

[wallpaper from unsplash](https://unsplash.com/photos/ciO5L8pin8A)

![scrot](scrots/scrot3.png)
![scrot](scrots/scrot2.png)
![scrot](scrots/scrot1.png)

update the installation and enable nonfree repos for proprietary nvidia driver

```
sudo xbps-install -Su
sudo xbps-install -Su void-repo-nonfree
sudo xbps-install -Su nvidia
```

these are the packages you need to install on void to get my setup up and running

```
sudo xbps-install -S lemonbar rofi bspwm sxhkd rxvt-unicode xorg-minimal xorg-fonts neofetch xwallpaper dunst picom ranger pywal zathura zathura-pdf-poppler git ImageMagick neovim cmark pulseaudio pavucontrol terminus-font stalonetray curl nodejs betterlockscreen redshift sxiv redshift-gtk w3m lxappearance papirus-icon-theme pcmanfm xarchiver gvfs p7zip libunarr xdo xtitle xclock dhcpcd-gtk scrot pfetch
```

get vimplug up and running after installing neovim

``curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim``

inside of neovim just execute ``:PlugInstall``


### explanation of packages

lemonbar (status bar)
- xdo
- xtitle
- xclock

rofi (application launcher)

bspwm (window manager)
- xorg-minimal (x server)
- xorg-fonts (apps need fonts so you should probably install this or something else)
- sxhkd (hotkey daemon for bspwm)

rxvt-unicode (terminal emulator)

neofetch (a fetch script)
pfetch  (a smaller fetch script)

xwallpaper (easily set wallpapers in X)

dunst (notifiaction daemon)

picom (compositor)

ranger (terminal tui file manager)

pywal (ricing assistant, i use it to store color schemes)

zathura (minimal document viewer)
- zathura-pdf-poppler (pdf support)

git (because you  probably need it to clone my configs)

ImageMagick (i only really use the ``convert`` command to make solid color wallpapers)

neovim (my text editor of choice)

cmark (minimal markdown to html compiler for the commonmark implementation of markdown)

pulseaudio (better audio stuff)
pavucontrol (being able to control pulse audio in a gui is nice)

terminus-font (my monospace programming font of choice)

stalonetray (this lets you have a system tray with lemonbar)

curl (not sure why this isnt installed by default but you need it to get vim-plug working)

nodejs (for coc.nvim)

betterlockscreen (a simple and decent looking lockscreen)

redshift-gtk  (make you screen yellow at night)
- redshift

sxiv (simple image viewer for X, it has a neat gallery mode and opens images ina  reasonable size (whhc is helpful for tiling window managers))

w3m (for ranger image preview to work you want this)

lxappearance (to set your icon/gtk themes)

papirus-icon-theme (a simple flat icon set)

pcmanfm (a gui file manager)
- gvfs (trashcan support)

xarchiver (gui archive manager)
- p7zip (7zip support)
- libunarr (rar support)

dhcpcd-gtk (gui for network management with dhcpcd)

scrot  (screentshot utility)
