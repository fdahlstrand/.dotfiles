#!/usr/bin/env bash
sudo apt update
sudo apt dist-upgrade

sudo apt-add-repository --yes --update ppa:ansible/absible
sudo apt install ansible
