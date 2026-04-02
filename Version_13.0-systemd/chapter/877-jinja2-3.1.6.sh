#!/bin/bash

#--------------------------------
# 8.77.1. Installation of Jinja2
#

pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD

pip3 install --no-index --find-links dist Jinja2
