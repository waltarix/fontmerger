FROM ubuntu:focal

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
	&& DEBIAN_FRONTEND=interactive apt-get install -y --no-install-recommends \
		tzdata=2020a-0ubuntu0.20.04 \
	&& apt-get install -y --no-install-recommends \
		fontforge=1:20190801~dfsg-4 \
		git=1:2.25.1-1ubuntu3 \
		gosu=1.10-1 \
		make=4.2.1-1.2 \
		python3-fontforge=1:20190801~dfsg-4 \
		python3-pip=20.0.2-5ubuntu1 \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip3 --no-cache-dir install peru==1.2.0

ENV PYTHONDONTWRITEBYTECODE=1

COPY entrypoint.sh /usr/local/bin

WORKDIR /fontmerger
ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/bash", "-l"]
