module BrewSparkling
  module Action
    module Install
      class InstallApp < Base
        def call
          logger.start "Installing app"
          if install_app
            logger.info "⚡️ #{recipe.name} is installed"
          else
            logger.error "🙅  #{recipe.name} install is failed"
          end
        end

        private

        def install_app
          system 'mobiledevice', 'install_app', recipe.app_path
        end
      end
    end
  end
end
