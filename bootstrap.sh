
#!/usr/bin/env bash

echo bootstrap.sh provisioning starting...
# This bootstrap script is meant to be executed as part
# of a vagrant provisioning process, in the context of the guest VM

if [ command -v rvm >/dev/null 2>&1 ]  #only run RVM once
then
	echo "RVM already installed, skipping."
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
	# -L location (follows redirects)

	# bash -s stable --rails --quiet-curl --autolibs=enabled --gems=sinatra,watchr --debug
    # pipe into bash
    # -s read commands from standard input (e.g. pipe)
    # "stable" version of RVM to use
    #   (note "head" is current cutting edge, sometimes needed to fix issues)
    # --rails install rails as well
    # --quiet-curl passes -s to curl, silent output
    # --autolibs=enabled not sure
    # --gems=sinatra,watchr install listed gems
    # --debug extra debugging output (use when reporting issues)

	su -l vagrant -c '\curl -s -L https://get.rvm.io | bash -s stable --rails --quiet-curl --autolibs=enabled --gems=sinatra,watchr'

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

if [command -v heroku-toolbelt >/dev/null 2>&1]
then
	echo "heroku-toolbelt already installed, skipping."
else
	echo == installing heroku-toolbelt ==
	# install heroku-toolbelt from website script
	su -l vagrant -c 'wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh'
fi

echo bootstrap.sh provisioning completed.

