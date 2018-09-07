ContainerBox 
============

What is it?
-----------
  A tool on top of LXD to easily create and use containers with full graphical capability (a display manager and a desktop environment)
  
Why?
----
  The main idea is to have the usability from virtualization tools like VirtualBox but without the overhead of running inside a VM. Unprivilleged LXC containers allow for near 0 overhead while still maintaining reasonnable isolation.

How does it work?
-----------------
   The host managed resources are exposed to the container when the latter is not able to manage them (ex: starting a display server).
  Security is kept in mind so everything that needs to run on the host is isolated as much as possible (ex: nested Xorg server run as unprivilleged user) .
 
Usage
-----
-  **Install**
+ Install *lxd* and *xephyr* (and *xpra* if you want) on your host 
+ Run install.sh
  
-  **Create a container**
+ ContainerBox create -n NAME_OF_CONTAINER(required) -t DISTRO_TO_USE (ubuntu debian fedora -- default: fedora) -d DESKTOP_ENVIRONMENT(KDE GNOME XFCE MATE -- default: XFCE) --x yes|no (experimental xpra support -- default:no)
  
-  **Start a container**
+ ContainerBox start -n NAME -m DISPLAY_METHOD (xephyr xpra xorg[!!!security concern !!!] -- default: xephyr) -f yes|no (fullscreen ?)

-  **GPU accelerated app in container**
+ ContainerBox runapp NAME "command arg1 arg2 ... argN" (NOTE: requires to either be running inside a wayland environment, or having kwin_wayland and XWayland installed)

-  **Configure a container**
+ ContainerBox config network|system|shared_folder|sound NAME_OF_CONTAINER(required) [ OPTIONS ]

-  **Take Snapshot of a container**
+ ContainerBox snapshot NAME_OF_CONTAINER(required) create|restore|save_state|restore_state|export|import|list [OPTIONS]

-  **Show Usage**
+ ContainerBox create|config|runapp|snapshot help
 
TODO List (in order of priority)
--------------------------------
- Improve install script (create .deb and .rpm packages ?)
- Write user documentation
- Create a nice GUI on top of the CLI (WIP)
- Install from an ISO image (maybe use QEMU to perform the install the lxd-p2c)
- Your suggestions (as long as it can be done through LXD/LXC)

AUTHOR:
-------
Alexandre Dey

DISCLAIMER
----------

This is still experimental use at your own risk (no real reason for it to break anything, but still)
GNOME is not working unless you login as root (still figuring it out)
 