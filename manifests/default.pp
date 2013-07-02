# puppet config to set up rails

# Make sure apt-get -y update runs before anything else.
stage { 'preinstall':
  before => Stage['main']
}

# TODO: This command causes timeout errors. Distribute to update 
# key packages? Upgrade last? upgrade in script phase?
# updates AND upgrades box (for weekly updates)
class apt_get_update {
  exec { '/usr/bin/apt-get -y update && /usr/bin/apt-get -y dist-upgrade':
    user => 'root',
    timeout => 900 # temporary fix, 15 minute timeout
  }
}

class { 'apt_get_update':
  stage => preinstall
}

# install RVM prereq packages
package { [ 'build-essential',
'zlib1g-dev',
'libssl-dev',
'libreadline-dev',
'git-core',
'libxml2',
'libxml2-dev',
'libxslt1-dev',
'sqlite3',
'libsqlite3-dev',
'nodejs',
]:
ensure => installed,
}

# install watchr gem
# todo: sinatra?
package { 'watchr':
    ensure   => 'installed',
    provider => 'gem',
}

# RMagick system dependencies
package { ['libmagickwand4', 'libmagickwand-dev']:
ensure => installed,
}
