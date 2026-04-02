#!/bin/bash

#-------------------------------------
# 8.45.1. Installation of XML::Parser
#

perl Makefile.PL

make

echo -e "\n[lfs-scripts] Starting test of $3 at $(date)\n"

make test

echo -e "\n[lfs-scripts] Finishing test of $3 at $(date)\n"

make install
