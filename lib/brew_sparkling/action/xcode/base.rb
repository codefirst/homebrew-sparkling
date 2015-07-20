module BrewSparkling
  module Action
    module Xcode
      class Base
        private

        def gateway
          Gateway::Xcode.default
        end
      end
    end
  end
end
