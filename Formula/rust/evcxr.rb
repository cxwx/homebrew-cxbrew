class Evcxr < Formula
  desc "Evaluation context for Rust: REPL, Jupyter Kernel"
  homepage "https://github.com/evcxr/evcxr"
  url "https://github.com/evcxr/evcxr/archive/refs/tags/v0.22.0.tar.gz"
  sha256 "b55ecd5e31470e04229f57b1eb2a73e0385828642a8a9afea7385a4983b33203"
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
