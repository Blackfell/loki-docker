# Loki-docker

**This build is very much in Alpha!** Read on, heed the warnings and take care.

A Dockerised implementation of Insinuators Loki networking attack tool for use on Linux, tested only on Kali 2020.

This port is not actively maintained and has just been developed to support OSPF attacks for a specific learning activity I'm undertaking. Any comments, feedback or pull requests very welcome to improve protability of Loki, which is, but for its difficulty of installation, a nice tool. 

## What do?

This is just a simple Loki build in a container, EXCEPT, there are wrapping shell scripts on both the host and container side to pass the magic cookie from X11 to the container, so that the GUI can be displayed on the host. 

## Health Warning!

This is a seriously messed up docker implementation of [the original Loki tool](https://insinuator.net/tag/loki/). Why? Well because whilst it's been wrestled into a container, it still needs to function - it has been configured to run in privileged mode with full host network access and it has access to your valid X11 magic cookie so that it can still do its GUI thing. It's not really a good idea to run a tool this way in any vageuly important environment, so you probably shouldn't download, run or use this implementation to be honest - it's risky and may break, for eveyone's sake, close the browser now and enjoy your life. 

## Requirements

This is designed to work on Linux only. It's been (briefly!) tested on Kali linux 2020.1. The image is based on the stock Ubuntu:12.04 DockerHub image and has a direct build-from-deb process is sat on top, but the display of the application is Linux only at the moment.

## Installation

This image is just and so available at version 0.6 via dockerhub, so no manual setup is required, simply use:

```
$ git clone https://github.com/Blackfell/loki-docker && cd loki-docker && sudo ./run_loki.sh
```

And you're away. 

Of you could pull the image and run directly with equivalent command line flags to the above script. All packages have been pulled directly from [the upstream Loki developers](https://insinuator.net/tag/loki/), so if you like manual setup, you should also be able to rebuild, optionally re-downloading the .deb files etc. yourself:

```
$ git clone https://github.com/Blackfell/loki-docker loki-docker && cd loki-docker
[...]
# Download your debs etc.
# Inspect the Docker file if you like
$  sudo docker build -t loki:0.6 . 
[...]
```

Then you could replace the call to blackfell/loki:0.6 with your local image name. 

## Usage 

Usage is as per the original Loki: 
https://insinuator.net/tag/loki/

The default docker command mounts /opt/loki-data to container root, as well as mounting /usr/share/wordlists to /root/wordlists and can be called via the quick script included in this repo. 

```
$ sudo ./run_loki.sh
# Profit
```
### Entry point?

Loki is a GUI application, so a handler script is used inside the container to configure xorg access, using run_loki.sh manages this for you, inspect it if you want to do stuff.

# Bugs? Feedback?

There are definately untested elements of Loki in this build and some IP6 dependencies almost certainly aren't working correctly. Please send feedback my way! info@blackfell.net - pull requests welcome.
