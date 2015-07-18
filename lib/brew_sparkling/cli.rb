require 'brew_sparkling/handler'

module BrewSparkling
  class Cli
    attr_reader :args

    def initialize(argv)
      @command, *@args = *argv
    end

    def call
    end
  end
end
