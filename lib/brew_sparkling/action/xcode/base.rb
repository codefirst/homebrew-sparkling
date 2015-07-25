module BrewSparkling
  module Action
    module Xcode
      class Base
        private

        def user
          @user ||= User.new
        end

        def gateway
          user.gateway
        end
      end
    end
  end
end
