# Dual Boot Guide

*NOTE: this guide assumes you have a basic understanding of linux and computer/hardware and comes with no warranty, I am not responsible for any loss of data or damge to hardware/persons, be sure to test all these steps in a virtual machine if you are uncofortable and use this as an auxilliary to the [void linux documentation](https://docs.voidlinux.org/installation/index.html). This article serves mainly as a list of steps I took to to install windows 10 alongside void linux. Your steps may be slightly different*

With that out of the way heres the guide.

I installed void linux on a separate hard drive alongside windows 10 and the install process was easier and quicker than any other distribution I've tried (arch, fedora, mint and pop!_os).

## Step 1

Before you write any ISOs or boot into the install media there are a few thing you must do in windows and your BIOS.

### 1

ensure the disk you wnat to install void to is empty (delete partitions under windows)

### 2

[Set windows 10 to use UTC time](https://wiki.archlinux.org/index.php/System_time#UTC_in_Windows).

This will save you the headache of having your system time be incorrect after switching between linux and windows.

Run the following command from an Administrator Command Prompt.

```
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_QWORD /f
```

### 3

[Disable fastboot in windows 10](https://help.uaudio.com/hc/en-us/articles/213195423-How-To-Disable-Fast-Startup-in-Windows-10).

Navigate to the control panel>power options then select "Choose what the power buttons do".
You may need to select the option "Change settings that are currently unavailable" to see the shutdown settings.
Deselect the fast startup, hibernate and sleep options.
If you would like to still use the sleep options under windows have a look [here](https://wiki.archlinux.org/index.php/Dual_boot_with_Windows#Fast_Startup_and_hibernation).

### 4

[Download the void linux installer](https://alpha.de.repo.voidlinux.org/live/current/) and burn to a USB flash drive using [balena etcher](https://www.balena.io/etcher/)

(I used the ``void-live-x86_64-musl-20191109.iso `` image but any of the x86_64 ones should work fine)

## Step 2 reboot and change boot order in BIOS

After your USB drive has finished close all programs in windows and shutdown.

When you turn your computer on you may have to press a specific key (in my case ``del`` but often ``f12`` also works) to enter the BIOS menu.

Make sure to check your motherboard manufacturers website for documentation (or you know just google it.)

Once inside the BIOS menu you need to do a couple things and the method for accomplishing this is different for every motherboard, so be sure to have another device with a web browser ready to do some troubleshooting.

1. change the boot order so that it boots form the usb
2. disable secure boot
3. set BIOS to use Legacy+UEFI (for modern computers)

## Step 3 boot into live image

Once you've gotten the BIOS settings right and have manged to boot into the live ISO the difficult stuff should be over.

Login as root using the information presented (password should be ``voidlinux``)

## Step 3

After booting into the void installer and logging in as root run ``lsblk`` to identify your drive name (should be ``sdX`` where X will be either a,d,c,d,e, etc).

Take note of which drive has your windows installation you don't want to overwrite that.

## Step 4

Start the void installer using the ``void-installer`` command.

Follow all the steps for your installation specifics (languages, keyboard layout, user name etc.)
Once you get to partitioning make sure you select the correct drive (remember the output of the ``lsblk`` command earlier).

## Step 5 Partitioning

Make a 100M EFI system partition (this should be formatted as FAT32 in the filesystems step of the installer).

Make a generic Linux Filesystem partition (this will act as the root partition).

If you need help partitioning or want to setup swap or home partitions [check this out](https://wiki.archlinux.org/index.php/Partitioning#Partition_scheme).

The void-installer program uses ``cfdisk`` for partitioning if you need some guidance on finding help.

After partitioning your drive you should format the EFI system partition as FAT32 and set ``/boot/efi`` as the mount point.

For the Linux filesystem partition you should format as ext4 and set the mount point as ``\`` (root).

## Step 6 after install

After the install you should reboot and enter the BIOS as before.
This time we need to set the boot order to boot from the drive you installed void linux to.
In my BIOS there was also a "Hard drive boot BBS priority" option that I needed to change to use GRUB instead of the windows boot loader.

While in the BIOS you can remove the USB flash drive.

Save your BIOS changes and reboot.

If all went well you should boot to a grub menu where you can select void linux or windows to boot.

## Step 7 fixing GRUB that doesn't detect windows

If your GRUB menu doesn't present you with the option to boot windows follow the following steps.

1. boot into void and login.
2. run  ``$ sudo os-prober``. If ``os-prober`` is not installed you can install it using ``$ sudo xbps-install -S os-prober``. (This command should output something about windows. If it doesn't and you are still not presented with the option to boot windows after following steps 3 and 4 look [here](https://wiki.archlinux.org/index.php/Dual_boot_with_Windows), [here](https://wiki.archlinux.org/index.php/GRUB) and [here](https://wiki.archlinux.org/index.php/GRUB#Generated_grub.cfg) for some more help).
3. regenerate GRUB config by running ``$ sudo grub-mkconfig -o /boot/grub/grub.cfg``.
4. reboot.

You should now have the option to boot void linux and windows.

## Step 8

Install all the packages you need and enjoy your new void linux system.

Alternatively you can follow [my setup guide](https://github.com/kevin-nel/void-linux-rice) to setup void linux with my configs and programs.
