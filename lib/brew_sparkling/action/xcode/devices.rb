module BrewSparkling
  module Action
    module Xcode
      class Devices < Base
        def call
          gateway.devices.each do |device|
            puts "#{device.name}"
          end
        end
      end
    end
  end
end
