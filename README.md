## README

My rice on void linux.If you want to know how I set up my dual boot with windows 10 [check here](https://github.com/kevin-nel/void-linux-rice/blob/master/dual_boot_void_win10_guide.md)

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

If you would like to use the free nvidia (``nouveau``) drivers then install the ``xf86-video-nouveau`` package instead.

### Step 2: Install packages

these are the packages you need to install on void to get my setup up and running

```
$ sudo xbps-install -S lemonbar rofi bspwm sxhkd rxvt-unicode xorg-minimal dejavu-fonts-ttf neofetch xwallpaper dunst picom ranger pywal zathura zathura-pdf-poppler git ImageMagick neovim cmark pulseaudio pavucontrol terminus-font stalonetray curl nodejs betterlockscreen redshift sxiv redshift-gtk lxappearance papirus-icon-theme pcmanfm xarchiver gvfs p7zip libunarr xdo xtitle xclock dhcpcd-gtk scrot pfetch xdotool xdotool
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
$ sudo xbps-install -S flatpak xdg-desktop-portal xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk xdg-utils
```

Add the [flathub repository.](https://flatpak.org/setup/Void%20Linux/)


```
$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

now to install a flatpak just run (note: I could not get flatpak to install applications without sudo or using the ``flatpak install --user`` option)

```
$ sudo flatpak install <app_name>
```

if you have any issue [check the void wiki first](https://wiki.voidlinux.org/Flatpak)

### bonus spotify flatpak

My audio in the spotify flatpak didn't work so I had to follow [these steps to set up pulse audio correctly]().


Install the necessary packages
```
$ sudo xbps-install -S alsa-utils pulseaudio ConsoleKit2
```

Enable the respective services
```
$ sudo ln -s /etc/sv/alsa /var/service/
$ sudo ln -s /etc/sv/cgmanager /var/service/
$ sudo ln -s /etc/sv/consolekit /var/service/
```

if you didn't enable dbus earlier enable the dbus service now.

```
$ sudo ln -s /etc/sv/dbus /var/service/
```

You may also have to run spotify like below and/or add ``start-pulseaudio-x11 &`` to your ``.xinitrc`` (I didn't have to do this)

```
$ pulseaudio --start && flatpak run com.spotify.Client
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
- dejavu-fonts-ttf  (most apps need fonts adn this package provides alot of them without being too bloated)
- sxhkd (hotkey daemon for bspwm)
- xdotool (window names for bspwm external rules)

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

to see the list of explicitely installed packages on your system run the following command

```
$ xbps-query -m
```
the output of this command for my system is saved in ``packages.txt``
