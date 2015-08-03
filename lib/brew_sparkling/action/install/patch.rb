module BrewSparkling
  module Action
    module Install
      class Patch < Base
        def call
          return unless recipe.respond_to?(:patch)

          logger.start "Patch to: #{recipe.build_path}"

          at_build_path do
            IO.popen('patch -p1', 'r+') do |io|
              io.puts recipe.patch
              io.close_write
              logger.info io.read
            end
          end
        end
      end
    end
  end
end
