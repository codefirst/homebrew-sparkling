module BrewSparkling
  module Action
    module Install
      class Build < Base
        def call
          logger.start "Build to: #{recipe.archive_path}"

          subdir = recipe.build_path.children

          case subdir.size
          when 0
            fail 'Empty Archive'
          when 1
            Dir.chdir(subdir.first) { recipe.build }
          else
            Dir.chdir(recipe.build_path) { recipe.build }
          end
        end
      end
    end
  end
end
