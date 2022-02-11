exec { 'apt-update':
	command => '/usr/bin/apt-get update'
     }
package { 'redis-server':
	require => Exec['apt-update'],
	ensure => installed
	}
exec { 'systemctl redis-server start':
 	path  => '/usr/bin:/usr/sbin:/bin',
	command => '/bin/systemctl'
     }
service { 'redis-server':
	ensure => running
	}
package { 'build-essential':
        require => Exec['apt-update'],
        ensure => installed
        }

package { 'libgdbm5':
        require => Exec['apt-update'],
        ensure => installed
        }

package { 'zlib1g-dev':
        require => Exec['apt-update'],
        ensure => installed
        }


package { 'libreadline6-dev':
        require => Exec['apt-update'],
        ensure => installed
        }

package { 'libyaml-dev':
        require => Exec['apt-update'],
        ensure => installed
        }


package { 'libssl1.0-dev':
        require => Exec['apt-update'],
        ensure => installed
        }

exec { 'rbenv':
  command => 'git clone https://github.com/rbenv/rbenv.git /root/.rbenv/',
        creates => '/root/.rbenv',
        cwd     => '/root/',
  path    => '/usr/bin'
   }

	 file {
  '/vagrant/v4/template.sh':
  ensure => 'file',
  path => '/vagrant/v4/template.sh',
  owner => 'root',
  group => 'root',
  mode  => '0744', 
  notify => Exec['template.sh']
 }
 exec {
 'template.sh':
 command => '/vagrant/v4/template.sh',
 cwd => '/vagrant/v4/'
 }


exec { 'ruby-build':
      command => 'git clone https://github.com/rbenv/ruby-build.git plugins/ruby-build',
           creates => '/root/.rbenv/plugins',
           cwd     => '/root/.rbenv/',
      path    => '/usr/bin'
       }
                                                                                                                                                                                                                                                                           
