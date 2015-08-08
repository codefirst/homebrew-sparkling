require 'plist'

module BrewSparkling
  module Action
    module Install
      # Free provisioning plan does not provide wildcard provisioning.
      # So you should use expliict app id.
      #
      # But app id require world-wide uniqueness. So we must create
      # a unique bundle identifier per user.
      #
      # Ordinally, bundle identifier is stored at Info.plist. So,
      # we traversal project directory and rewrite it.
      class ChangeId < Base

        def call
          logger.start "Add prefix to bundle identifier: #{user.prefix}"

          update_info_plist do |plist|
            update! plist, %w(CFBundleIdentifier WKCompanionAppBundleIdentifier WKAppBundleIdentifier) do |key, original|
             "#{user.prefix}.#{original}".tap { |id|
               logger.info "#{key}: #{original} => #{id}"
             }
            end
            plist
          end
        end

        private

        def update_info_plist(&f)
          recipe.info_plists.each do |info|
            # convert to xml
            system 'plutil', '-convert', 'xml1', info

            # parse
            original = Plist::parse_xml(info)

            updated = f.call(original)

            File.write info, updated.to_plist
          end
        end

        def update_hash(hash, key, &f)
          if hash.key? key
            hash[key] = f.call hash[key]
          end

          hash
        end

        def update!(hash, keys, &f)
          hash.each do |key, value|
            if keys.include?(key)
              hash[key] = f.call(key, value)
            elsif value.is_a?(Hash)
              update!(value, keys, &f)
            end
          end
        end
      end
    end
  end
end
