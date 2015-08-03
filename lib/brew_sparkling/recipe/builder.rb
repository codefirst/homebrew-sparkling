module BrewSparkling
  module Recipe
    class Builder
      class << self
        def inherited(klass)
          (@all ||= []) << klass
        end

        def all
          @all
        end

        def github(path, branch: 'master')
          url "https://github.com/#{path}/archive/#{branch}.tar.gz"
        end

        %i(bundle_identifier url version).each do |name|
          define_method name do |value|
            define_method(name) { value }
          end
        end

        def patch(value)
          if value == :DATA
            # read after __END__
            define_method(:patch) do
              data = ""
              path.open("rb") do |f|
                begin
                  line = f.gets
                end until line.nil? || /^__END__$/ === line
                data << line while line = f.gets
              end
              data
            end
          else
            # inline string
            define_method(:patch) { value }
          end
        end
      end

      attr_reader :path

      def initialize(path)
        @path = path
      end

      def name
        self.class.to_s
      end
    end
  end
end
