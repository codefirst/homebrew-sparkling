module BrewSparkling
  module Recipe
    module Extension
      module Build
        def command(*args)
          unless system(*args)
            fail "command failed: #{args.join(' ')}"
          end
        end

        def xcodebuild_archive(workspace: nil, scheme: nil)
          extra_args = ""

          if workspace
            extra_args << " -workspace '#{workspace}'"
          end

          if scheme
            extra_args << " -scheme '#{scheme}'"
          end

          command "xcodebuild #{extra_args} -archivePath #{archive_path} archive #{xcpretty}"
        end

        def bundle(*args)
          gem_command 'bundle', gem_name: 'bundle', args: args
        end

        def pod(*args)
          gem_command 'pod', gem_name: 'cocoapods', args: args
        end

        def which?(command)
          system("which #{command} > /dev/null 2>&1")
        end

        private

        def gem_command(name, gem_name: nil, args: [])
          unless which?(name)
            fail <<-END
Cannot find command: #{name}
Please install with: gem install #{gem_name}
            END
          end
          command name, *args
        end

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
