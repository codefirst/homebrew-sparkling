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
    end
  end
end
