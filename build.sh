#!/usr/bin/env bash

echo == Cleanup Phase ==
echo cleaning up previous builds
./clean.sh

echo == Build Phase ==
echo building rails_lab_coat vm with vagrant...
vagrant up

echo == Package Phase ==
#package build
./package.sh