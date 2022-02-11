class bashrc {

file { "bashrc file":
    path => "/root/.bashrc",
    source  => "/mnt/bashrc",
    owner   => "root",
    group   => "root",
    mode    => "0644",
     }

exec { "root_bashrc":
    command     => "source  /root/.bashrc'",
    cwd => "/root",
    provider => 'shell',
     }

}
