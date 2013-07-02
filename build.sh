#!/usr/bin/env bash

# TODO: Check all return statuses for errors, abort if so
#       Note: may need to do so recursively in all scripts

echo == Cleanup Phase ==
echo cleaning up previous builds
./clean.sh

echo == Build Phase ==
echo building rails_lab_coat vm with vagrant...
vagrant up

echo == Package Phase ==
#package build
./package.sh

echo =====================================
echo == rails lab is ready for science! ==
echo =====================================
