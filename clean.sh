# todo: Sepparate script to remove boxes

# if the rails_lab_coat directory exists
if [ -d "rails_lab_coat" ]; then
	#remove the generated virtual machine
	echo removing generated virtual machine
	(cd rails_lab_coat; vagrant destroy -f)

	# delete output copy
	rm -rf ./rails_lab_coat
fi

# remove the build template virtual machine
echo removing template virtual machine
vagrant destroy -f

