# removes traces of generated virtual machine
# good for repackaging

# if the rails_lab_coat directory exists
if [ -d "rails_lab_coat" ]; then
	#remove the generated virtual machine
	(cd rails_lab_coat; vagrant destroy -f)

	# delete output copy
	rm -rf ./rails_lab_coat
fi

# remove the lab base box
vagrant box remove railslab virtualbox