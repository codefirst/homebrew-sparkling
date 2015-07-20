module BrewSparkling
  module Action
    module Install
      class InstallApp < Base
        def call
          system 'mobiledevice', 'install_app', recipe.app_path
        end
      end
    end
  end
end
