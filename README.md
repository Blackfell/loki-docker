# loki-docker

**This build is very much in Alpha!** Read on, heed the warnings and take care.

A Dockerised implementation of Insinuators Loki networking attack tool for use on Linux, tested only on Kali 2020.

This tool is not actively maintained and has just been developed to support OSPF Route Injection attacks for a specific learning activity I'm undertaking. Any comments, feedback or pull requests very welcome to improve protability of Loki, which is, but for its difficulty of installation, an excellent tool. 

## Requirements

This implementation of Loki has been (briefly!) tested on Kali linux 2020.1, with a valid docker installation. The image is based on Ubuntu:12.04 from DockerHub, which you of course must trust if you want to trust this implementation. 

## Warning!

This is a seriously messed up docker implementation of [the original Loki tool](https://insinuator.net/tag/loki/). Why? Well because it's been wrestled into a container and still needs to function, it has been configured to run in privileged mode with full host network access and a valid xorg magic cookie so that it can still do its thing. Only a foolish person would run a tool this way, so you probably shouldn't download, run or use this implementation - it's risky and may break, for eveyone's sake, close the browser now and enjoy your life. 

It is up to you to decide if you want to continue from here, you could simply go and install Loki yourself, which will give you a safer and more secure implementation, as well as hours of quality entertainment and dependency management joy. 

## Installation

This image is just and so available at version 0.6 via dockerhub, so no manual setup is required, simply use:

```
$ git clone https://github.com/Blackfell/loki-docker && cd loki-docker && sudo ./run_loki.sh
```

And you're away. 

Of you could pull the image and run directly, All packages have been pulled directly from [the upstream Loki developers](https://insinuator.net/tag/loki/), so if you like manual setup, you should be able to rebuild, optionally re-downloading these yourself:

```
$ git clone https://github.com/Blackfell/loki-docker loki-docker && cd loki-docker
[...]
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

# Feedback?

Please send it my way! info@blackfell.net pull requests welcome.
