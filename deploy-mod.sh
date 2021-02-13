#!/bin/bash

set -e

cd $(dirname "${0}")

ssh root@192.168.51.1 "mount / -o remount,rw"
ssh root@192.168.51.1 "rm -f /usr/lib/python3.4/site-packages/browsepy/*.pyc"

scp browsepy/*.py root@192.168.51.1:/usr/lib/python3.4/site-packages/browsepy/
scp browsepy/static/*.* root@192.168.51.1:/usr/lib/python3.4/site-packages/browsepy/static/
scp browsepy/templates/*.html root@192.168.51.1:/usr/lib/python3.4/site-packages/browsepy/templates/
# scp -r  browsepy/static/fonts/cooper root@192.168.51.1:/usr/lib/python3.4/site-packages/browsepy/static/fonts/

ssh root@192.168.51.1 "systemctl restart browsepy"
