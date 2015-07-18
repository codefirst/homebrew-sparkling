require 'pathname'
$LOAD_PATH.unshift(File.expand_path('..', Pathname.new(__FILE__).realpath))

require 'brew_sparkling/cli'

BrewSparkling::Cli.new(ARGV).call

exit 0
