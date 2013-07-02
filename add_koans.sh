# Adding koans per
# https://twitter.com/jimweirich/status/351920198930014208
# Jim Weirich's advice
# requires at least git and rake

#clone (if they don't already exist)
[ ! -d ./ruby_koans ] && git clone https://github.com/neo/ruby_koans.git

#do "rake gen" - in directory context
(cd ruby_koans;rake gen)

#then distribute the koans dir.
mv ruby_koans/koans ./rails_lab_coat/shared/
