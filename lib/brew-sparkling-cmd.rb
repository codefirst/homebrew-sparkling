require 'pathname'

$LOAD_PATH.unshift(File.expand_path('..', Pathname.new(__FILE__).realpath))

puts "⚡️ #{ARGV.inspect}"

exit 0
