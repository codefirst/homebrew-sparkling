module BrewSparkling
  module Handler
    class << self
      def register(name, klass)
        @@command ||= {}
        @@command[name] = klass
      end

      def invoke(name, args)
        command = @@command[name].new(args)
        command.send name
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
require 'brew_sparkling/handler/xcode'
require 'brew_sparkling/handler/install'
require 'brew_sparkling/handler/recipe'
