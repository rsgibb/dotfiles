#!/bin/sh

PFX=$(lsof | grep compatdata | grep 'pfx$' | awk '{print $NF}')
WINEPREFIX=$PFX wineserver -k
