class BrewSparkling < Formula
  homepage "https://github.com/codefirst/homebrew-sparkling/"
  url "https://github.com/codefirst/homebrew-sparkling.git", tag: "v0.1.0"
  head "https://github.com/codefirst/homebrew-sparkling.git", branch: "master"

  skip_clean "bin"

  depends_on "mobiledevice" => :build
  depends_on "cocoapods" => :ruby

  def install
    # install xcode plugin
    plugin.install 'plugin/SparklingHelper.xcplugin'

    # install sparkling command
    prefix.install 'bin', 'recipe', 'lib', 'gems'
    (bin+"brew-sparkling").chmod 0755
  end

  def plugin
    @plugin ||= Pathname('~/Library/Application Support/Developer/Shared/Xcode/Plug-ins').expand_path
  end
end
