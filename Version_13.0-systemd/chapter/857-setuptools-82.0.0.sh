#!/bin/bash

#------------------------------------
# 8.57.1. Installation of Setuptools
#

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD

pip3 install --no-index --find-links dist setuptools
