#!/bin/bash -x

WORKDIR=$(pwd)

pip install .
pip install .[tests]
pip install .[libvirt]

# If duffy.key is available then install duffy ansible module.
if [ -e "duffy.key" ]; then
    # duffy key needs to be in home dir by default
    cp duffy.key ~

    # Link duffy module linchpin library
    pushd ~
    linchpin_path=$(python -c 'import os, linchpin; print os.path.dirname(linchpin.__file__)')
    popd
    if [ -n "$linchpin_path" ]; then
        pushd $linchpin_path/provision/library
        ln -s $WORKDIR/duffy-ansible-module/library/duffy.py .
        popd
    fi
fi
