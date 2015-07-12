class BrewSparkling < Formula
  homepage "https://github.com/codefirst/homebrew-sparkling/"
  url "https://github.com/codefirst/homebrew-sparking.git", tag: "v0.1.0"
  head "https://github.com/codefirst/homebrew-sparking.git", branch: "master"

  skip_clean "bin"

  depends_on "mobiledevice" => :build

  def install
    prefix.install "lib" => "lib"
    prefix.install "Sparkling", "bin"
    (bin+"brew-spark").chmod 0755
  end
end
