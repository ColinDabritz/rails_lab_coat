#!/usr/bin/env bash

echo bootstrap.sh provisioning starting...

if [ -e "/home/vagrant/.rvm" ]  #only run RVM once 
then
	echo "RVM already installed"
else

	echo rvm magic...
	
	# RVM official install command (from https://rvm.io/):
	# \curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled
	# -s (=silent_ and --quiet-curl removes progress bars
	## TODO: Still getting spam after 
	## ruby-2.0.0-p195 - #downloading ruby-2.0.0-p195, this may take a while depending on your connection...
	# these don't behave well and spam the console durring vagrant provisioning
	# todo: Still not completely silent gets?
	# su to run as vagrant, this prevents issues using gems later e.g.
	# Errno::EACCES: Permission denied 
	# - /usr/local/rvm/gems/ruby-2.0.0-p195/build_info/coffee-script-source-1.6.2.info

	su -l vagrant -c '\curl -s -L https://get.rvm.io | bash -s stable --rails --quiet-curl --autolibs=enabled'

	echo cleanup
	# fix profile snafu, RVM drops path adjustment into users bash profile, overriding profile
	# include .profile in .bash_profile
	
	# including .profile in bootup, .bash_profile if it exists, or .bash_login
	echo "source ~/.profile" >> /home/vagrant/.bash_profile

	echo zeroing disk for final image size...
	# run zerodisk script (provided by puppet) to prep disk size for packaging
	# (from puppets zerodisk.sh script, /home/vagrant/zerodisk.sh)
	# Zero out the free space to save space in the final image:
	dd if=/dev/zero of=/EMPTY bs=1M
	rm -f /EMPTY

	# TODO: Date stamp machine? MOTD?

	echo bootstrap.sh provisioning completed...
fi