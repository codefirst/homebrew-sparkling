module BrewSparkling
  module Recipe
    module Extension
      module Build
        def command(*args)
          unless system(*args)
            fail 'command failed'
          end
        end

        def xcodebuild_archive(scheme: nil)
          extra_args = ""
          if scheme
            extra_args << " -scheme #{scheme}"
          end
          command "xcodebuild #{extra_args} -archivePath #{archive_path} archive #{xcpretty}"
        end

        private

        def xcpretty
          @xcpretty ||= if system('which xcpretty > /dev/null')
                          '| xcpretty --color'
                        else
                          ''
                        end
        end
      end
    end
  end
end
