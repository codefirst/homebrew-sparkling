require 'brew_sparkling/recipe/entry'

module BrewSparkling
  module Recipe
    class Dsl
      class Builder
        attr_reader :entry
        def initialize(entry)
          @entry = entry
        end

        %i(name bundle_identifier url version).each do |name|
          define_method name do |value|
            entry.send(:"#{name}=", value)
          end
        end

        def build(&f)
          entry.build_code = f
        end
      end

      def eval(code)
        instance_eval(code)
      end

      def recipe(&f)
        Entry.new.tap do |entry|
          builder = Builder.new(entry)
          builder.instance_eval(&f)
        end
      end
    end
  end
end
