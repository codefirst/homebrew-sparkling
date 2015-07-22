module BrewSparkling
  module Action
    module Install
      class RequestProvisioning < Base
        def call
          bundle_id = "#{recipe.app_id}.#{user.postfix}"
          puts "Request provisioning: #{bundle_id}"
          user.gateway.request_provisioning user.account, user.certificate, user.device, bundle_id
        end
      end
    end
  end
end
