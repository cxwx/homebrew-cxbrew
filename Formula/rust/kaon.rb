# TODO:
class Kaon < Formula
  desc "A human readable object notation / serialization format that syntactic similar to Rust and completely supports Serde's data model."
  homepage "https://github.com/eternal-io/keon"
  head "https://github.com/eternal-io/keon", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "yazi-cli")

  end

end
