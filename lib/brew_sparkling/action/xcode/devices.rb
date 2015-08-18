module BrewSparkling
  module Action
    module Xcode
      class Devices < Base
        def call
          devices = gateway.devices

          if devices.empty?
              puts 'No deviecs'
          else
            devices.each do |device|
              puts "#{device.name}"
            end
          end
        end
      end
    end
  end
end
