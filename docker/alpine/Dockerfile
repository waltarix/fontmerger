FROM alpine:3.12

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN apk add --no-cache -Xhttp://dl-cdn.alpinelinux.org/alpine/edge/testing \
		fontforge=~20200314 \
		git=~2 \
		make=~4 \
		py3-pip=~20 \
		su-exec=~0.2 \
	&& pip --no-cache-dir install peru==1.2.0

ENV PYTHONDONTWRITEBYTECODE=1

COPY entrypoint.sh /usr/local/bin

WORKDIR /fontmerger
ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/ash"]
