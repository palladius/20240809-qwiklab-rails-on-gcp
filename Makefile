

# remember this
# eval "$(rbenv init -)"

ruby-docs-samples-copy:
	git clone https://github.com/GoogleCloudPlatform/ruby-docs-samples.git ruby-docs-samples-copy

dbpassword:
	cat /dev/urandom | LC_ALL=C tr -dc '[:alpha:]'| fold -w 50 | head -n1 > dbpassword

