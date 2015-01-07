group {'developer':
	ensure => present,
}

user {'developer':
	ensure => present,
	gid => 'developer',
	shell => '/bin/bash',
	home => '/home/developer',
	managehome => 'true',
	password => '$6$HYilSZKDMYH.7i$nEuPmDOJmuCYVWMWuUP7efFxAl0PHs4QQpNLWyQw42Fg4dhDMhydQbpsKUNgcAtyCOq/FU8YPYfjE/lz4p.L/0',
}
