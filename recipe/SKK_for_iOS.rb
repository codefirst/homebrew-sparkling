class SKK_for_iOS < BrewSparkling::Recipe::Builder
  github 'codefirst/SKK-for-iOS', branch: 'beta-4'
  description 'SKK(Simple Kana to Kanji conversion program) for iOS'
  version '0.1'
  bundle_identifiers %w(org.codefirst.SKK.SKK-for-iOS org.codefirst.SKK.SKK-for-iOS.SKK-Keyboard)

  def build
    xcodebuild_archive(scheme: 'SKK-for-iOS')
  end
end
