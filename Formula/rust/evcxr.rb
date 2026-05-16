class Evcxr < Formula
  desc "An evaluation context for Rust: REPL, Jupyter Kernel"
  homepage "https://github.com/evcxr/evcxr"
  url "https://github.com/evcxr/evcxr/archive/refs/tags/v0.21.1.tar.gz"
  sha256 "904b397ac402d71d32587971477529acf6226ea1ae8c08c4558c2f670793fbda"
  license "MIT"

  depends_on "rust" => :build

  def install
    %w[evcxr evcxr_repl evcxr_jupyter].each do |pkg|
      system "cargo", "install", "--path", pkg, "--locked", "--root", prefix.to_s
    end
  end

  test do
    # no-op: REPL cannot be tested non-interactively
  end
end
