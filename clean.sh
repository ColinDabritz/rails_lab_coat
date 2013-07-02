# todo: Sepparate script to remove boxes

echo removing generated and packaged virtual machine
./clean_packaged.sh

# remove the build template virtual machine
echo removing template virtual machine
# remove vagrant machine
vagrant destroy -f
# remove vagrant hidden folder
rm -rf .vagrant