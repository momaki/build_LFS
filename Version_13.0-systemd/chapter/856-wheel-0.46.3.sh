#!/bin/bash

#-------------------------------
# 8.56.1. Installation of Wheel
#

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD

pip3 install --no-index --find-links dist wheel
