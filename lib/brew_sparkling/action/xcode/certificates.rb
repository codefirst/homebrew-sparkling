module BrewSparkling
  module Action
    module Xcode
      class Certificates < Base
        def call
          gateway.certificates.each do |certificate|
            puts certificate.commonName
          end
        end
      end
    end
  end
end
