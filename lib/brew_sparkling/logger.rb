require 'colorize'

module BrewSparkling
  class Logger
    class << self
      def default
        @logger ||= new
      end
    end

    def start(message)
      puts "==> #{message}".colorize(:blue)
    end

    def error(message)
      puts message.colorize(:red)
    end

    def info(message)
      puts message.colorize(:green)
    end
  end
end

