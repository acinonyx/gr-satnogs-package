FROM resin/rpi-raspbian:latest
MAINTAINER Vasilis Tsiligiannis <acinonyx@openwrt.gr>

# Switch to a temporary working directory
WORKDIR /tmp/

# Add backports repository
RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-keys "8B48AD6246925553 7638D0442B90D010" \
	&& echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list

# Install necessary packages
RUN apt-get update \
	&& apt-get -y --no-install-recommends install \
		build-essential \
		cmake \
		swig \
		doxygen \
		git \
		pkg-config \
		debhelper \
	&& apt-get -y --no-install-recommends install \
		libboost-dev \
		libboost-filesystem-dev \
		libboost-system-dev \
		libvorbis-dev \
		libpng-dev \
		libnova-dev \
		liblog4cpp5-dev \
	&& apt-get -y --no-install-recommends install \
		shared-mime-info \
	&& apt-get -y --no-install-recommends -t jessie-backports install \
		gnuradio-dev

# Copy packaging directories
COPY debian /tmp/debian/

# Copy packaging script
COPY build.sh /usr/local/bin/
