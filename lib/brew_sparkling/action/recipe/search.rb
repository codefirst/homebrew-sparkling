module BrewSparkling
  module Action
    module Recipe
      class Search < Base
        def call(name)
          recipes.each do |recipe|
            puts recipe.name if recipe.name =~ /#{name}/
          end
        end
      end
    end
  end
end
