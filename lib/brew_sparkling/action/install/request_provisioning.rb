module BrewSparkling
  module Action
    module Install
      class RequestProvisioning < Base
        def call
          logger.start "Request provisioning"
          recipe.bundle_identifiers.each do |id|
            bundle_id = "#{user.prefix}.#{id}"
            logger.info bundle_id
            user.gateway.request_provisioning(user.account, user.certificate, user.device, bundle_id)
          end
        end
      end
    end
  end
end
