#!/bin/bash

groupadd -g ${DK_GID:-1001} fontmerger
useradd -M -u ${DK_UID:-1001} -g ${DK_GID:-1001} -s /bin/bash fontmerger

exec gosu fontmerger "$@"
