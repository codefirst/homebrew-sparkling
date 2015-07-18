require 'brew_sparkling/handler'

module BrewSparkling
  class Cli
    attr_reader :args

    def initialize(argv)
      @command, *@args = *argv
    end

    def call
      unless Handler.exist? command_name
        STDERR.puts "unknown command: #{command_name}"
        # TODO: show help
        return
      end

      Handler.invoke command_name, args
    end

    private

    def command_name
      @command.to_sym
    end
  end
end
