# puppet config to set up rails

# Make sure apt-get -y update runs before anything else.
stage { 'preinstall':
  before => Stage['main']
}

# updates AND upgrades box (for weekly updates)
class apt_get_update {
  exec { '/usr/bin/apt-get -y update && /usr/bin/apt-get -y dist-upgrade':
    user => 'root',
    timeout => 900 # 15 minute timeout, process can be lengthy
  }
}

class { 'apt_get_update':
  stage => preinstall
}

# add a gemrc before RVM install that skips ri and rdoc
file {
  "/etc/gemrc":
    ensure => present,
    content => "gem: --no-rdoc --no-ri\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
}

# install RVM prereq packages
package { [ 'build-essential', # ruby/rvm requirements
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
          'gawk',
          'autoconf',
          'libgdbm-dev',
          'libncurses5-dev',
          'automake',
          'bison',
          'libffi-dev',
          'tree', # visualize file structures, nice for learning
          ]:
ensure => installed,
}