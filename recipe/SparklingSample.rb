recipe do
  name 'SparklingSample'
  url 'https://github.com/codefirst/SparklingSample/archive/1.0.1.tar.gz'
  version '1.0.1'
  bundle_identifier 'org.codefirst.SparklingSample'

  build do
    system <<-END
            cd #{build_path}/SparklingSample-1.0.1/
            xcodebuild -scheme SparklingSample -archivePath #{archive_path} archive #{xcpretty}
            END
  end
end
