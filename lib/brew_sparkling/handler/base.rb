module BrewSparkling
  module Handler
    class Base
      class << self
        def command(*names)
          names.each do |name|
            ::BrewSparkling::Handler.register name, self
          end
        end
      end

      attr_reader :args
      def initialize(args)
        @args = args
      end
    end
  end
end
