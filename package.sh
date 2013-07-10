echo == prepare for imaging ==
echo Copying template...
# copy template to final destination
cp -r ./labtemplate ./rails_lab_coat

echo running machine for final packaging
vagrant up --no-provision

echo == managing image files ==

echo removing build scripts...
# execute these commands on the vm using vagrant SSH
# remove helper shell scripts
# remove compressed ruby and rails (we use RVM in build)
vagrant ssh -c "sudo rm /home/vagrant/*.sh"
vagrant ssh -c "sudo rm /home/vagrant/*gz"

echo compressing disk image...
# from puppet image zerodisk.sh script
# Zero out the free space to save space in the final image:
vagrant ssh -c "sudo dd if=/dev/zero of=/EMPTY bs=1M"
vagrant ssh -c "sudo rm -rf /EMPTY"

echo halting virtual machine for final packaging
vagrant halt
echo == packaging image ==

# package box file into final destination
vagrant package --output ./rails_lab_coat/box/railslab.box

echo adding ruby koans...
# add ruby koans
./add_koans.sh

echo packaging complete!
