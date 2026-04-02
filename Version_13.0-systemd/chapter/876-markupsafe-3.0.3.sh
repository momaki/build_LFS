#!/bin/bash

#------------------------------------
# 8.76.1. Installation of MarkupSafe
#

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD

pip3 install --no-index --find-links dist Markupsafe
