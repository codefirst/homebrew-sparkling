require 'brew_sparkling/location'

module BrewSparkling
  module Recipe
    class Recipe

      attr_reader :name, :url, :version, :app_id

      def initialize(name, url, version, app_id, &build_code)
        @name = name
        @url = url
        @version = version
        @app_id = app_id
        @build_code = build_code
      end

      def build_path
        Location.build_path.join(name, version)
      end

      def archive_path
        Location.archive_path.join(name, version)
      end

      def info_plists
        xs = []
        traversal build_path do |entry|
          xs << entry if entry.basename.fnmatch? 'Info.plist'
        end
        xs
      end

      def app_path
        Location.archive_path.join(name, "#{version}.xcarchive", 'Products', 'Applications', "#{name}.app")
      end

      def xcpretty
        @xcpretty ||= if system('which xcpretty > /dev/null')
                        '| xcpretty'
                      else
                        ''
                      end
      end

      def build
        instance_eval(&@build_code)
      end

      private

      def traversal(path, &f)
        directories = [ path ]

        until directories.empty? do
          d = directories.shift
          d.each_child do |entry|
            if entry.directory?
              directories << entry
            else
              f.call entry
            end
          end
        end
      end
    end
  end
end
