echo "packaging build to vagrant box..."

echo == preparing machine for packaging ==
echo running machine for final packaging cleanup
vagrant up --no-provision

echo == compressing image ==
# execute these commands on the vm using vagrant SSH
# remove helper shell scripts
# remove compressed ruby and rails (we use RVM in build)
vagrant ssh -c "sudo rm /home/vagrant/*.sh"
vagrant ssh -c "sudo rm /home/vagrant/*gz"

# from puppet image zerodisk.sh script
# Zero out the free space to save space in the final image:
vagrant ssh -c "sudo dd if=/dev/zero of=/EMPTY bs=1M"
vagrant ssh -c "sudo rm -rf /EMPTY"

echo == packaging image ==
vagrant halt

# copy template to final destination
cp -r ./labtemplate ./rails_lab_coat

# package box file into final destination
vagrant package --output ./rails_lab_coat/box/railslab.box
# todo: copy ruby koans to shared directory
# todo: default rails app? TBD

echo =====================================
echo == rails lab is ready for science! ==
echo =====================================
