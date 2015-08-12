require 'brew_sparkling/location'

module BrewSparkling
  module Recipe
    module Extension
      module Path
        def build_path
          Location.build_path.join(name, version)
        end

        def archive_path
          Location.archive_path.join(name, version)
        end

        def info_plists
          xs = []
          traversal build_path do |entry|
            xs << entry if plist?(entry.basename)
          end
          xs
        end

        def app_path
          Location.archive_path.join(name, "#{version}.xcarchive", 'Products', 'Applications', app_name)
        end

        def app_name
          if respond_to? :executable_name
            executable_name
          else
            "#{name}.app"
          end
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
end
