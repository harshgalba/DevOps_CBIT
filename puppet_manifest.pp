# Experiment 9: Puppet Manifest (Complete)

# 1. Creates a file hello.txt with text 'Hello Puppet!'.
file { '/tmp/hello.txt':
  ensure  => file,
  content => 'Hello Puppet!',
}

# 2. Ensures a specific directory exists.
file { '/tmp/my_test_dir':
  ensure => directory,
}

# 3. Installs the 'httpd' package (Apache).
# This sets the HOME variable to your *correct* user home,
# /Users/harshgalba, which fixes the permission error.
exec { 'install_httpd_with_brew':
  
  # Set HOME to your actual user's home directory
  command => 'sh -c "export HOME=/Users/harshgalba; brew install httpd"',
  
  # Do the same for the 'unless' check
  unless  => 'sh -c "export HOME=/Users/harshgalba; brew list httpd"',
  
  # Provide the path to find the 'brew' executable
  path     => ['/opt/homebrew/bin', '/usr/local/bin', '/usr/bin', '/bin'],
  
  # Explicitly tell Puppet to use the shell
  provider => 'shell',
}
