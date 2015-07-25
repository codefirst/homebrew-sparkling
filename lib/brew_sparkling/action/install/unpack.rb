require 'tmpdir'

module BrewSparkling
  module Action
    module Install
      class Unpack < Base
        def call
          # snip from homebrew-cask
          logger.start "Unpackking #{tarball_path.basename} to: #{recipe.build_path}"
          Dir.mktmpdir do |unpack_dir|
            system('/usr/bin/tar', 'xf', tarball_path, '-C', unpack_dir)
            system('/usr/bin/ditto', '--', unpack_dir, recipe.build_path)
          end
        end
      end
    end
  end
end
