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

        # simple getter definition
        %i(bundle_identifiers url version executable_name description).each do |name|
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

        def bundle_identifier(name)
          bundle_identifiers [name]
        end
      end

      attr_reader :path

      def initialize(path)
        @path = path
      end

      def name
        self.class.to_s
      end

      def local_file(name)
        path.join('..', name).read
      end

      def plist?(name)
        name.basename.fnmatch? 'Info.plist'
      end
    end
  end
end
