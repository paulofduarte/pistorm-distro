# pistorm-distro

**EXPERIMENTAL: This project was barely tested and it's unlikely to work as expected. if you know what you're doing please test and report any found issues**

![pistorm logo](resources/pistorm_logo.png)

This project is a joint effort to bring a customised Linux distro for the project [pistorm](https://github.com/captain-amygdala/pistorm) developed by the great [Capitain Amygdala](https://github.com/captain-amygdala) and the community.
In the current state the project uses [Raspberry PI OS Lite](https://www.raspberrypi.org/software/operating-systems/) light, which causes long boot times when starting up your system.

The pistorm-distro is been developed with [buildroot](https://buildroot.org) an amazing tool to create custom embedded Linux systems.

---

## Authors

This project is beeing developed with the help of the amazing [pistorm](https://github.com/captain-amygdala/pistorm) comunity on the [pistorm discord channell](https://discord.com/invite/j6rPtzxaNW)

At the moment the effort counts with 2 developers, hopefully there will be more collaborators soon.

### We are:

- [mikewolak](https://github.com/mikewolak)
- [paulofduarte](https://github.com/paulofduarte)

---
## How to use

You'll need:
* Amiga 500/500+/1000/2000 (other 68000 based computers may work in the future).
* [Rapberry PI 3 A+](https://www.raspberrypi.org/products/raspberry-pi-3-model-a-plus/) *Other models are know to work, but there are caveats like size constraints*.
* pistorm adapter board. **There's a semicondutor shortage going on now and those boards are very hard to get. Join the [discord channel]((https://discord.com/invite/j6rPtzxaNW)) for more info and to join a group buy.**

![The pistorm inside an Amiga A500](https://hackster.imgix.net/uploads/attachments/1287342/image_CfXuXLTYE1.png?auto=compress%2Cformat&w=740&h=555&fit=max)

*Picture from [hackster.io article](https://www.hackster.io/news/hands-on-with-the-pistorm-the-ultimate-raspberry-pi-powered-accelerator-for-your-commodore-amiga-449ef0634f3e)*

Download the latest pistorm-distro release and write the image into an sd card.
Plug your pi on the adapter board with, connect a keyboard and display and boot it. First boot will take some time to expand the file system to occupy the remaining space of your sd card.

Login to your pi with ``username: root`` and ``password: pistorm``. On the first time using the adapter board you'll need to install the firmware. You can do it using the following commands:

````
cd /opt/pistorm
./nprog_240.sh
````

If the ``nprog_240.sh`` fails you may have an older revision of the adpter boards, try ``nprog.sh`` instead.

Now remove the 68000 CPU from your computer and intall the pistorm into its place. Make sure you install it with the correct orientation.

Power on your amiga, *et voila*.

---

## Contributing

This is a simple project so far, all the heavy lifting was done by [pistorm](https://github.com/captain-amygdala/pistorm) and [buildroot](https://buildroot.org).

To build the project is as simple as running the following on a linux terminal:

````
git clone https://github.com/paulofduarte/pistorm-distro.git
cd pistorm-distro
chmod u+x build.sh
./build.sh
````
The first build will take quite long. Remember you are cross compiling an entire Linux distro. Subsequent builds are quite fast, provided you don't remove the buildroot-xxxx.xx.xx folder from your project. The package containing the sdcard image will be at the release folder at the end of the build.

You'll need to have the following packages installed on your linux.

````
build-essential
file
cpio
bc
libncurses-dev - for menuconfig only
````

If you are not using Linux or do not wish to modify your system you can use [docker](https://www.docker.com). Best experience is with [VS Code](https://code.visualstudio.com), just open the project folder on code and use the ["Reopen in container"](https://code.visualstudio.com/assets/docs/remote/containers/dev-container-reopen-prompt.png) feature. A preconfigured container with everything you need to build and maintain the code will be created, while you keep the same experience as using code in your host system.

The folder structure in the project is very simple as follows:

* **.devcontainer** - VS Code integrated container definition.
* **.github** - GitHub Actions workflow definitions.
* **buildroot-xxxx.xx.xx** - location where buildroot is installed after first build. Here's where the magic happens.
* **release** - where the zip file containing the sdcard image is stored after the build is finished. 
* **resources** - Where the actual sources and configs to be applied by buildroot are stored.
* **<PROJECT_ROOT>** - Scripts and documentation

The most likely change is to change the buildroot configuration, a convinience script ``menuconfig.sh`` is provided. The script will prepare, launch the menuconfig and after the configuration is finished it will update the copy into ``resources``.

In the end the project is a buildroot project, so if you need more information on buildroot, refer the [user manual](https://buildroot.org/downloads/manual/manual.html).
