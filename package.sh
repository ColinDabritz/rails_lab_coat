echo "packaging build to vagrant box..."
echo copying template...
cp -r ./labtemplate ./rails_lab_coat

vagrant package --output ./rails_lab_coat/box/railslab.box
# todo: copy ruby koans to shared directory
# todo: default rails app? TBD

echo rails lab is ready for science!
