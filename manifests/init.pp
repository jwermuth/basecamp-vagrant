group {$developer:
	ensure => present,
}

# The @ marks a virtual resource. 
# A virtual resource is similar to a reference
@user {$developer:
	ensure => present,
	gid    => $developer,
	shell  => '/bin/bash',
    home   => "/home/${developer}",
	groups  => ["sudo"],
	managehome => 'true',
	# password is 'developer', you should change it 8)
	password => '$6$HYilSZKDMYH.7i$nEuPmDOJmuCYVWMWuUP7efFxAl0PHs4QQpNLWyQw42Fg4dhDMhydQbpsKUNgcAtyCOq/FU8YPYfjE/lz4p.L/0',
}
# Here we are using (sending to the client) the 
# User resource defined in the @ Virtual resource style above
realize User[$developer]

host { 'ci':
    ip => $ciip,
}

