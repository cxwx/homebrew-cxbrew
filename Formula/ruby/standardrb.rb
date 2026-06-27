class Standardrb < Formula
  desc "Ruby code analyzer and formatter, part of the Standardrb code style"
  homepage "https://github.com/standardrb/standard"
  url "https://rubygems.org/gems/standard-1.55.0.gem"
  sha256 "8a8f2c3e681a4db3aafde1b301561b0f3d7c5f06c160167cb744a4d7baf0426e"
  license "MIT"
  head "https://github.com/standardrb/standard.git", branch: "main"

  livecheck do
    url "https://rubygems.org/api/v1/gems/standard.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", "--no-document", cached_download
    bin.install libexec/"bin/standardrb"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/standardrb --version")
  end
end
