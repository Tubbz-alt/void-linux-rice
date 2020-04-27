## README

My rice on void linux.

[wallpaper from unsplash](https://unsplash.com/photos/ciO5L8pin8A)

![scrot](scrots/scrot3.png)
![scrot](scrots/scrot2.png)
![scrot](scrots/scrot1.png)

## Steps to reproduce

### Step 1: update installation add non free repo

update the installation and enable nonfree repos for proprietary nvidia driver

```
$ sudo xbps-install -Su
$ sudo xbps-install -Su void-repo-nonfree
$ sudo xbps-install -Su nvidia
$ sudo xbps-install -Su base-devel
```

Installing the base-devel package adds stuff like gcc and other utilities that are helpful if you program or if you will be compiling programs form source but it is optional

if you would like to use the free nvidia (``nouveau``) drivers then install the ``xf86-video-nouveau`` package instead.

### Step 2: Install packages

these are the packages you need to install on void to get my setup up and running

```
$ sudo xbps-install -S lemonbar rofi bspwm sxhkd rxvt-unicode xorg-minimal xorg-fonts neofetch xwallpaper dunst picom ranger pywal zathura zathura-pdf-poppler git ImageMagick neovim cmark pulseaudio pavucontrol terminus-font stalonetray curl nodejs betterlockscreen redshift sxiv redshift-gtk w3m lxappearance papirus-icon-theme pcmanfm xarchiver gvfs p7zip libunarr xdo xtitle xclock dhcpcd-gtk scrot pfetch
```

### Step 3: Clone this repository and copy the neseccary files

clone this repository and copy the config files into their places

**NB Very Important** copy the ``autostart`` script as well as the ``lemonbar-script`` in the ``Scripts/`` folder somewhere in your ``$PATH``

### Step 4: get neovim up and running (optional)

if you also want my neovim config then after copying that over you also need to do the following.

get vimplug up and running after installing neovim

`` $ curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim``

inside of neovim just execute ``:PlugInstall``

if you want to use coc.nvim then [check out the repository to add the languages you need](https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim)

### Step 5: add flatpak

If you want to use applications that  need glibc but still want to run musl  on your main install then using flatpak is a great  way to get around this.
Its also great place to get  proprietary apps like discord and still keep them sandboxed from your operating system.

Firstly flatpak as well as bigger gui apps require dbus to be running and I struggled to get flatpak working without this.

Enable the dbus service by running the [following command](https://docs.voidlinux.org/config/bluetooth.html?highlight=dbus#installation) and reboot (or logout and back in)

```
$ sudo ln -s /etc/sv/dbus /var/service/
```

install the flatpak package as well as the xdg-desktop-portal packages (without these flatpak could not access host resources and install packages)


```
$ sudo  xbps-install -S flatpak xdg-dektop-portal xdg-dektop-portal-gtk
```

Add the [flathub repository.](https://flatpak.org/setup/Void%20Linux/)


```
$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

now to install a flatpak just run (note: I could not get flatpak to install applications without sudo or using the ``flatpak install --user`` option)

```
$ sudo flatpak install <app_name>
```

## Step 6: check if microcode has been installed

In my case void correctly installed the microcode packages without a hiccup.
To check if void has correctly installed the microcode run the following

```
$ xbps-query -s linux-firmware
```

you should see the  ``linux-firmware-amd``, ``linux-firmware-intel``, and ``linux-firmware-nvidia`` packages with an ``*`` to indicate they are installed. (you may not need all the packages as this depends on your hardwar)


### explanation of packages

```
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
- nodejs (for coc.nvim)

cmark (minimal markdown to html compiler for the commonmark implementation of markdown)

pulseaudio (better audio stuff)
pavucontrol (being able to control pulse audio in a gui is nice)

terminus-font (my monospace programming font of choice)

stalonetray (this lets you have a system tray with lemonbar)

curl (not sure why this isnt installed by default but you need it to get vim-plug working)

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
```
