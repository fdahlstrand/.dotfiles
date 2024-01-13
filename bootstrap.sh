#!/usr/bin/env bash
apt update
apt dist-upgrade

apt install software-properties-common

apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible
