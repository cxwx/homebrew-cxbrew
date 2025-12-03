class Thulac < Formula
  desc "An Efficient Lexical Analyzer for Chinese"
  homepage "https://thulac.thunlp.org/"
  license "MIT"
  head "https://github.com/cxwx/THULAC.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-B", "builddir", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_CXX_COMPILER=#{which(ENV.cxx)}", "-DTHULAC_BUILD_TARGET=homebrew"
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
  test do
    system "echo", "not finished"
  end
end
