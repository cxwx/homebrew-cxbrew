class Evcxr < Formula
  desc "Evaluation context for Rust: REPL, Jupyter Kernel"
  homepage "https://github.com/evcxr/evcxr"
  url "https://github.com/evcxr/evcxr/archive/refs/tags/v0.23.0.tar.gz"
  sha256 "8ec5d893750f78284a53e918779e8c73e971398b8bcc6f22bd1c7a4e86956c1f"
  license "MIT"

  depends_on "rust" => :build

  def install
    %w[evcxr evcxr_repl evcxr_jupyter].each do |pkg|
      system "cargo", "install", "--path", pkg, "--locked", "--root", prefix.to_s
    end
  end

  test do
    system "true"
  end
end
