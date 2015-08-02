require 'brew_sparkling/location'

module BrewSparkling
  module Recipe
    Entry = Struct.new :name, :url, :version, :bundle_identifier,:build_code do
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

      def build
        instance_eval(&build_code)
      end

      def xcodebuild_archive(scheme:)
        system "xcodebuild -scheme #{scheme} -archivePath #{archive_path} archive #{xcpretty}"
      end

      private

      def xcpretty
        @xcpretty ||= if system('which xcpretty > /dev/null')
                        '| xcpretty --color'
                      else
                        ''
                      end
      end

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
