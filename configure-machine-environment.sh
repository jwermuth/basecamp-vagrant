#!/bin/bash
echo Running configure-machine-environment.sh to setup any machine wide configuration required

DEVELOPER_ID=$1
echo Developer id is $DEVELOPER_ID 

LINE_TO_ADD_DEVELOPER_ID=DEVELOPER_ID'='$DEVELOPER_ID

echo searching for $LINE_TO_ADD_DEVELOPER_ID in /etc/environment

if grep -q $LINE_TO_ADD_DEVELOPER_ID /etc/environment; then
    echo DEVELOPER_ID environment variable already present. Doing nothing.
else
    echo DEVELOPER_ID environment variable not present, adding it to /etc/environment now
    echo '# DEVELOPER_ID added by configure-machine-environment.sh at' `date` >> /etc/environment
    echo $LINE_TO_ADD_DEVELOPER_ID >> /etc/environment
fi
