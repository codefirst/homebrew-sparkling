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
          update_info_plist do |plist|
            update_hash plist, 'CFBundleIdentifier' do |original|
              "#{original}.#{user.postfix}"
            end
          end
        end

        private

        def update_info_plist(&f)
          recipe.info_plists.each do |info|
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
      end
    end
  end
end
