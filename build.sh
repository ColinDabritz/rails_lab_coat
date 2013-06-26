#!/usr/bin/env bash

# clean?
# rm -r ./railslab

echo copying template...
cp -r ./labtemplate ./rails_lab_coat

echo building rails_lab_coat vm with vagrant...
vagrant up

# todo: this step should be a second script to package box
# this allows the user to manually adjust the VM before packaging for distribution
echo machine built, packaging build to vagrant box...
vagrant package --output ./rails_lab_coat/box/railslab.box
# todo: copy ruby koans to shared directory

echo rails lab is ready for science!
# TODO: at location xyz, point at getting started docs?