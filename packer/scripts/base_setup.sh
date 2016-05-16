#!/bin/sh
#
# Ops-Pipeline - Templates for automating the production and consumption of images
# and containers.
#
# Copyright 2016 Capital One Services, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
set -e
set -x

# hope to pick up proxy settings if we can
. /etc/profile

if which apk; then
	apk update
	apk add wget
	apk add curl
	apk add sudo
	apk add bash
	apk add git

elif which yum; then
	sudo yum update -y
	sudo yum update -y kernel
	sudo yum install -y wget curl virt-what net-tools git yum-utils
	if [ ! -f /.dockerinit  -a ! -f /.dockerenv ]; then
		sudo reboot
	fi
elif which apt-get; then
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get install -y wget curl virt-what git
	sudo apt-get remove -y juju juju-core libgl1-mesa-dri chef linux-firmware
	sudo apt-get -y autoremove
	sudo apt-get clean
	sudo apt-get autoclean
	if [ ! -f /.dockerinit  -a ! -f /.dockerenv ]; then
		sudo reboot
	fi
fi
