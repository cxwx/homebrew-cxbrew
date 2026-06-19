# cspell:disable
class MetaMorph < Formula
  desc "Small C++ Decorator Library"
  homepage "https://github.com/DeForestt/meta-morph"
  head "https://github.com/DeForestt/meta-morph.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
end
