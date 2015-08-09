module BrewSparkling
  module Recipe
    module Extension
      module Info
        def short_description
          if respond_to? :description
            description.lines.first
          else
            ''
          end
        end

        def to_s
          "#{name} - #{short_description}"
        end
      end
    end
  end
end
