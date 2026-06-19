class CppTimsort < Formula
  desc "C++ implementation of timsort"
  homepage "https://github.com/timsort/cpp-Timsort"
  url "https://github.com/timsort/cpp-TimSort/archive/refs/tags/v3.0.1.tar.gz"
  sha256 "f44aa826f2add2f15cf44f6547ea1e233dae6638e3a5c502fe3b272e17efaaf2"
  license "MIT"

  depends_on "cmake" => :build

  def install
    std_cmake_args
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    system "true"
  end
end
