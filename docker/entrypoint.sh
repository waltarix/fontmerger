#!/bin/sh

uid=${DK_UID:-1001}
gid=${DK_GID:-1001}
username=fontmerger
exec_wrapper=

if grep -m1 -q -s Alpine /etc/os-release; then
	adduser -u $uid -g $gid -DH -s /bin/ash $username
	exec_wrapper=su-exec
else
	groupadd -g ${DK_GID:-1001} $username
	useradd -u $uid -g $gid -M -s /bin/bash $username
	exec_wrapper=gosu
fi

exec $exec_wrapper $username "$@"
