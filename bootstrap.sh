
#!/usr/bin/env bash

echo bootstrap.sh provisioning starting...
# This bootstrap script is meant to be executed as part
# of a vagrant provisioning process, in the context of the guest VM

if [ -e "/home/vagrant/.rvm" ]  #only run RVM once
then
	echo "RVM already installed"
else
    echo == Running rvm ==
	# RVM official install command (from https://rvm.io/)
	# su -l vagrant -c
	#   to run as vagrant, this prevents issues using gems later e.g.

	#\curl -s -L https://get.rvm.io
	# leading \
	# "Please note that there is a backslash before curl,
	#   this prevents misbehaving if you have aliased it
	#	with other options or use a .curlrc file for this."
	# http://rvm.io/deployment/best-practices
	# -s silent (no progress bar)
	# -L follows redirects

	# bash -s stable --rails --quiet-curl --autolibs=enabled --gems=sinatra,watchr --debug
    # pipe into bash
    # -s not sure, more 'silent'? other meaning?
    # "stable" version of RVM to use ("head" is current cutting edge)
    # --rails install rails as well
    # --quiet-curl passes -s to curl, silent output
    # --autolibs=enabled not sure
    # --gems=sinatra,watchr install listed gems
    # --debug extra debugging output (use when reporting issues)

	su -l vagrant -c '\curl -s -L https://get.rvm.io | bash -s head --rails --quiet-curl --autolibs=enabled --gems=sinatra,watchr --debug'

	echo == Running post-rvm cleanup ==
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
fi

echo bootstrap.sh provisioning completed...

