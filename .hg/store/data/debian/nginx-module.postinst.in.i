         i   h       ����������h��m>##��噎�5I�W1�            u#!/bin/sh

set -e

if [ "$1" != "configure" ]; then
    exit 0
fi

%%MODULE_POST%%

#DEBHELPER#

exit 0
