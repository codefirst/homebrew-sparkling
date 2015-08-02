recipe do
  name 'SparklingSample'
  url 'https://github.com/codefirst/SparklingSample/archive/1.0.1.tar.gz'
  version '1.0.1'
  bundle_identifier 'org.codefirst.SparklingSample'

  build do
    xcodebuild_archive(scheme: 'SparklingSample')
  end
end
