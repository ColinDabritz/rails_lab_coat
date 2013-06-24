Rails Lab Coat
==============

Tools for doing rails science! (and cleaning up after yourself)

The purpose of lab coat is to provide an easy, safe learning environment for ruby on rails. We found that often new developers in our rails community spent thier entire first evening just atempting to get a working rails environment on their computers, and even then many were unsuccessful. Lab coat can get a new developer running rails in less than 10 minutes (a bit longer if they are unfamiliar with the command line). Later on, once they are more familiar with the environment, and tools, they can transition to a 'native' install on their main system with much more confidence and explore from there. It also provides a nice 'baseline' environment for experimentation, or teaching in a computer lab environment.

Requires:
* VirtualBox
 * https://www.virtualbox.org/
* vagrant
 * http://www.vagrantup.com/
* basic command line understanding
 * http://linuxcommand.org/

Installers may be provided on the same thumb drive

End users
---------
* ensure you have install the pre-requisites
* copy the rails_lab_coat folder from the provided thumb drive to your computer (if this isn't provided, you may need to create your own, which is more complicated. See "build" section below.)
* open that path in a terminal window (command prompt)
* bring the VM online, and get rails running these commands:
 * vagrant up
  * adds the virtual machine to VirtualBox, brings it online
 * vagrant ssh
  * gives 'remote' access to the virtual machines command line
 * cd /vagrant
  * switches to the shared directory (todo: fix this step, should be default directory)
 * rails new my_lab
  * creates a new default rails app in my_lab (or any name of choice) (todo: include a default rails app, fix this step)
 * cd my_lab (todo: update when fixed)
  * changes the directory (cd) into your newly created rails application
 * rails server
  * starts the rails server, hosting the application
* open the local rails url in a browser on your main computer: http://localhost:3000

This should open the rails application, displaying the default rails welcome page. If this isn't working for you, check that you followed each the steps.

Housekeeping:
When a VM is running, for example after 'vagrant up', it consumes resources, especially the computers memory. When not in use, it is helpful to 'park' your virtual machine. Here are some useful vagrant commands, which you run on your primary machine in the rails_lab_coat folder.

* vagrant up
 * get the machine running, regardless of its previous condition
* vagrant suspend
 * temporarily 'pause' the machine until needed again, frees resources and is quick to resume (with 'vagrant up')
* vagrant halt
 * shuts down the virtual machine, a more complete stop, takes time to boot, but may address issues that require rebooting the virtual machine.
* vagrant destroy
 * halts and deletes the virtual machine, including any custom modifications, or installed packages. Note that the shared directory is NOT deleted in this case. Projects you put in the shared directory should remain.
* vagrant ssh
 * 'jumps over' to the command line on the virtual machine. Most tutorial instructions should be run on the VM command line this way. Type 'exit' to get back to your normal machines command line. Also note vagrant commands must be entered from your normal command line, not the VM command line.

If the virtual machine is in a bad state, just remember: vagrant destroy && vagrant up
This command resets the VM to it's "factory default", although it will keep your shared directory.

Build Process
-------------
The respository here provides the tools to create a rails_lab_coat folder with a pre-made vagrant box file and vagrant file to set up a virtual machine ready for ruby-on-rails development. It was build for weekly user group use, and is intended to be rebuilt for each event to keep the system current.

This build script has worked on an OSX Mountain Lion laptop with git, virtual box, and vagrant installed. It may work on a similarly configured linux machine, but it has not been tested. The primary script is a bash script and will probably not work on windows.

Steps:
* clone or otherwise download the responsitory:
 * git clone git@github.com:ColinDabritz/rails_lab_coat.git
 * cd rails_lab_coat
* run the build script
 * ./build.sh
  * (TODO: may need execute permissions? chmod +x build.sh)
 * the build script will take quite a while to run, and includes many steps:
  * downloading the base puppet machine (if needed) (todo: is this being updated? how?)
  * setting up the machine, including a full apt-get upgrade
  * installing rails using rvm with the classic http://rvm.io/ script
  * Removing empty space and preparing the box for packaging
  * packaging the prepared box into a box file
  * copying the files into their final structure
  * see scripts for exact details
 * the rails_lab_coat directory should be prepared
* copy the folder to a thumb drive
 * (optional) copy installers for VirtualBox and vagrant to an 'installers' directory
* distribute at your local hacking event, and help welcome new members to your community!
* Don't forget to update the image for each event!

This VM provides:
* Ruby (Recent MRI version, >= 2.0.0)
* Rails, gems
* RVM
* Standard development tools
 * git
 * (todo: what else should be here?)
* To be added:
 * Ruby Koans (http://rubykoans.com/ , direct from git? other source? - in shared directory!)
 * Hartl Tutorial Compatability (todo: probably already ok, check this)
 * default rails project? (in shared directory, or is creating your own better?)
 * watchr (to run koans, nice tool)
 * (testing frameworks, rspec?)
 * editors (emacs, vim, pico, other?)
 * debugging tools?
 * transition guideance for your own environment?

This VM does NOT provide:
* A wide variety of configurations, such as multiple databases
* Deployment tools
* Your favorite plugins/tweaks etc, it is mainly stock by intention
* Specialized software for particular training

These are great things to have, but distract from the main goal of a simple starter environment. These may be added to your own machine once you learn to manage an environment, or you are welcome to fork the repository and create VM customizations for your own lab use.
(todo: break scripts up into phases so you can 'build', then customize by hand, then 'package'? provide hooks for a variation script?)

Let me know what I forgot!
