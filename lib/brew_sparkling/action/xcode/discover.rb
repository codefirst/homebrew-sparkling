module BrewSparkling
  module Action
    module Xcode
      class Discover < Base
        def call
          Gateway::Xcode.availables do |host, port|
            puts "http://#{host}::#{port}"
          end
        end
      end
    end
  end
end
