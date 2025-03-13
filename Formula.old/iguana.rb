# TODO: add 3rd conflicts, now not install
class Iguana < Formula
  desc "universal serialization engine"
  homepage "https://github.com/qicosmos/iguana"
  url "https://github.com/qicosmos/iguana/archive/refs/tags/1.0.7.tar.gz"
  sha256 "6e9bd93ac7f7e9a390042bea8922f18c745f726a6d7266ef6bfb0f7b7c94f789"
  license "Apache-2.0"
  head "https://github.com/qicosmos/iguana.git", branch: "master"

  def install
    include.install "iguana"
  end
  test do
    system "echo", "not finished"
  end
end
