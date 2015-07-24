recipe do
  name 'SparklingSample'
  url 'https://github.com/codefirst/SparklingSample/archive/1.0.tar.gz'
  version '1.0'
  bundle_identifier 'jp.codefirst.SparklingSample'

  build do
    system <<-END
            cd #{build_path}/SparklingSample-1.0/
            xcodebuild -scheme SparklingSample -archivePath #{archive_path} archive #{xcpretty}
            END
  end
end
