module BrewSparkling
  module Handler
    class << self
      def register(name, klass)
        @@command ||= {}
        @@command[name] = klass
      end

      def invoke(name, args)
        command = @@command[name].new
        command.send name, *args
      end

      def exist?(name)
        @@command.key? name
      end

      def commands
        @@command.keys.sort
      end
    end
  end
end

require 'brew_sparkling/handler/base'
require 'brew_sparkling/handler/help'
