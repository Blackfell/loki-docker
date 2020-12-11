# loki-docker

**This build is very much in Alpha!** Read on, heed the warnings and take care.

A Dockerised implementation of Insinuators Loki networking attack tool. 

This tool is not actively maintained and has just been developed to support OSPF Route Injection attacks for a specific learning activity I'm undertaking. Any comments, feedback or pull requests very welcome to improve protability of Loki, which is, but for its difficulty of installation, an excellent tool. 

## Requirements

This implementation of Loki has been (briefly!) tested on Kali linux 2020.1, with a valid docker installation. The image is based on Ubuntu:12.04 from DockerHub, which you of course must trust if you want to trust this implementation. 

## Warning!

This is a seriously messed up docker implementation of [the original Loki tool](https://insinuator.net/tag/loki/). Why? Well because it's been wresdtled into a container and still needs to function, it has been configured to run in privileged mode with full host network access and a valid xorg magic cookie. 

Only a foolish person would run a tool this way, so you probably shouldn't download, run or use this implementation, because it's risky, may break. It is up to you to decide if you want to continue here, or to go an install Loki yourself, which will be safer and give you hours of quality entertainment. All packages have been pulled directly from [the upstream Loki developers](https://insinuator.net/tag/loki/), you should be able to rebuild downloading these yourself. 

## installation

This image is not yet available via dockerhub (standby!), so manual setup is required:
```
$ git clone https://github.com/Blackfell/loki-docker loki-docker && cd loki-docker
[...]
$  sudo docker build -t loki:0.6 . # Loki version worked to is 0.6, get into the habit as I'll push this version to Docker hub eventually
[...]
```

## Usage 

Usage is as per the original Loki: 
https://insinuator.net/tag/loki/

The default docker command mounts /opt/loki-data to container root, as well as mounting /usr/share/wordlists to /root/wordlists and can be called via the quick script included in this repo. 

```
$ ./run_loki.sh
# Profit
```
### Entry point?
Loki is a GUI application, so a handler script is used inside the container to configure xorg access, using run_loki.sh manages this for you, inspect it if you want to do stuff.

# Feedback?

Please send it my way! info@blackfell.net pull requests welcome.
