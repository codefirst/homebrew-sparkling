module BrewSparkling
  module Action
    module Install
      class Build < Base
        def call
          puts "Build to: #{recipe.archive_path}"
          recipe.build
        end
      end
    end
  end
end
