module BrewSparkling
  module Recipe
    module Extension
      module Build
        def command(*args)
          unless system(*args)
            fail "command failed: #{args.join(' ')}"
          end
        end

        def xcodebuild_archive(scheme: nil)
          extra_args = ""
          if scheme
            extra_args << " -scheme '#{scheme}'"
          end
          command "xcodebuild #{extra_args} -archivePath #{archive_path} archive #{xcpretty}"
        end

        def pod(*args)
          unless which?('pod')
            fail <<-END
Cannot find command: pod
Please install with: gem install cocoapods
            END
          end
          command 'pod', *args
        end

        def which?(command)
          system("which #{command} > /dev/null 2>&1")
        end

        private

        def xcpretty
          @xcpretty ||= if which?('xcpretty')
                          '| xcpretty --color'
                        else
                          ''
                        end
        end
      end
    end
  end
end
