#!/usr/bin/env bash

# clean?
# rm -r ./railslab

echo copying template...
cp -r ./labtemplate ./rails_lab_coat 

echo building rails_lab_coat vm with vagrant...
vagrant up

echo machine built, packaging build to vagrant box...
vagrant package --output ./rails_lab_coat/box/railslab.box
# todo: copy to target location, ~/rails_lab_coat by default?

echo rails lab is ready for science!
# TODO: at location xyz, point at getting started docs?