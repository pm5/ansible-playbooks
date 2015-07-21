#!/bin/bash

if [[ "$1" == "" ]]; then
    echo "Usage: tvbox <hostname>"
    exit -1
fi

set -e

SRC_DIRECTORY="$HOME/src"
LIB_DIRECTORY="$HOME/lib"
ANSIBLE_DIRECTORY="$LIB_DIRECTORY/ansible"
ANSIBLE_PLAYBOOKS_DIRECTORY="$SRC_DIRECTORY/ansible-playbooks"

mkdir -p $SRC_DIRECTORY

sudo apt-get update -y && apt-get install git -y

source ./bootstrap.d/ansible
source ./bootstrap.d/ansible-playbooks

echo "Provision with Ansible"
cd $ANSIBLE_PLAYBOOKS_DIRECTORY
ansible-playbook tvbox.yml --ask-become-pass -e "hostname=$1"