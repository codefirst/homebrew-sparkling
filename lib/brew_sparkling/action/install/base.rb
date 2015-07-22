require 'brew_sparkling/recipe/recipe'
require 'brew_sparkling/user'

module BrewSparkling
  module Action
    module Install
      class Base
        def recipe
          # dummy
          code = <<-END
          echo hello
          echo hoge
          END

          Recipe::Recipe.new 'hello', 'https://github.com/mzp/helloworld-ios/archive/0.4.0.tar.gz', '0.4.0', 'ios-app-sample' do
            system <<-END
            cd #{build_path}/helloworld-ios-0.4.0/
            xcodebuild -scheme ios-app-sample -archivePath #{archive_path} archive #{xcpretty}
            END
          end
        end

        def user
          User.new
        end

        def tarball_path
          @tarball_path ||= Homebrew::Download.new(recipe).call
        end
      end
    end
  end
end
