class Nufmt < Formula
  desc "Code formatter for Nushell scripts"
  homepage "https://github.com/nushell/nufmt"
  head "https://github.com/nushell/nufmt.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--path", ".", "--locked", "--root", prefix.to_s
  end

  test do
    assert_match "nufmt", shell_output("#{bin}/nufmt --version")
  end
end
