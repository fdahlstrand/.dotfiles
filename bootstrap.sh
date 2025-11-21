#!/usr/bin/env bash

function get_distro() {
	if [[ -f /etc/os-release ]]
	then
		source /etc/os-release
		echo $ID
	else
		>&2 echo "Don't know how to determine distro."
		exit 1
	fi
}

case $(get_distro) in
	ubuntu)
		echo "Installing..."
		;;
	*)
		echo "Distro not supported"
esac	
