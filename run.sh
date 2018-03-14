#!/usr/bin/env bash

# Run this file to start everything
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:detectors/
guile -l dr-roboto.scm
