#From ubuntu:12.04
From ubuntu:11.04
MAINTAINER Blackfell info@blackfell.net
	
# Install Dependencies
RUN apt-get update -y && apt-get install gcc make zlib1g-dev zlib1g zlibc zlib1g-dbg autotools-dev vim xauth -y
RUN apt-get install libssl0.9.8 libdumbnet1 libpcap0.8 openssl libssl-dev quilt -y #libcrypto++9  -y
RUN apt-get install python python-gtk2 python-glade2 python-dpkt python-dumbnet python-ipy python-gobject -y

# Directory to keep stuff in relating to Loki
RUN mkdir /opt/loki-data

# Copy in and build Debian Package for Loki
COPY loki_0.2.7-1_amd64.deb /opt/ 
COPY pylibpcap_0.6.2-1_amd64.deb /opt/ 
RUN cd /opt/ &&  dpkg -i ./pylibpcap_0.6.2-1_amd64.deb && dpkg -i ./loki_0.2.7-1_amd64.deb 

#Set up environment and display stuff
RUN ldconfig 
COPY loki_init.sh /opt/
RUN touch /root/.Xauthority
ENTRYPOINT ["/opt/loki_init.sh"]

