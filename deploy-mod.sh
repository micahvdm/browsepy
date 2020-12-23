#!/bin/bash

set -e

cd $(dirname "${0}")

ssh root@moddwarf.local "mount / -o remount,rw"
ssh root@moddwarf.local "rm -f /usr/lib/python3.4/site-packages/browsepy/*.pyc"

scp browsepy/*.py root@moddwarf.local:/usr/lib/python3.4/site-packages/browsepy/
scp browsepy/static/base.css root@moddwarf.local:/usr/lib/python3.4/site-packages/browsepy/static/
scp browsepy/templates/*.html root@moddwarf.local:/usr/lib/python3.4/site-packages/browsepy/templates/
# scp -r  browsepy/static/fonts/cooper root@moddwarf.local:/usr/lib/python3.4/site-packages/browsepy/static/fonts/

ssh root@moddwarf.local "systemctl restart browsepy"
