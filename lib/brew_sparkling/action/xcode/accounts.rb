module BrewSparkling
  module Action
    module Xcode
      class Accounts < Base
        def call
          gateway.accounts.each do |account|
            puts account.username
          end
        end
      end
    end
  end
end
