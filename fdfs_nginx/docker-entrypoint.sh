#!/bin/sh

if [ -f "/usr/local/preproc.sh" ]; then
	bash /usr/local/preproc.sh
fi
rm -rf /usr/local/preproc.sh
exec "/usr/bin/supervisord"
