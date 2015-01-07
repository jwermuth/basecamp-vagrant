group {'developer':
	ensure => present,
}

user {'developer':
	ensure => present,
	gid => 'developer',
	shell => '/bin/bash',
	home => '/home/developer',
	managehome => 'true',
	password => sha1('developer'),
}
