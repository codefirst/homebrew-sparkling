require 'pathname'

# setup path
cwd = File.expand_path('..', Pathname.new(__FILE__).realpath)
$LOAD_PATH.unshift(cwd)
Gem.path << cwd + "/../gems/ruby/2.0.0"

# run cli
require 'brew_sparkling/cli'
BrewSparkling::Cli.new(ARGV).call

# bye bye
exit 0
