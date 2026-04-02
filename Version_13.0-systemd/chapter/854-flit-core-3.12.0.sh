#!/bin/bash

#-----------------------------------
# 8.54.1. Installation of Flit-Core
#

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD

pip3 install --no-index --find-links dist flit_core
