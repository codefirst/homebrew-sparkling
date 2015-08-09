class SparklingSample < BrewSparkling::Recipe::Builder
  github 'codefirst/SparklingSample', branch: '1.0.1'
  description 'sample for Sparkling'
  version '1.0.1'
  bundle_identifier 'org.codefirst.SparklingSample'

  def build
    xcodebuild_archive(scheme: 'SparklingSample')
  end
end
