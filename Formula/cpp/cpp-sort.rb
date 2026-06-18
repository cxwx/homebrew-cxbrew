# cspell:disable
class CppSort < Formula
  desc "Sorting algorithms & related tools for C++14"
  homepage "https://github.com/Morwenn/cpp-sort"
  url "https://github.com/Morwenn/cpp-sort/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "b86af13cb265cff5c47c6a064a5b537c754d5abdcd663064f62d358df43c789c"
  head "https://github.com/Morwenn/cpp-sort.git", branch: "main"  # BUG: no main nor master branch

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DCMAKE_CXX_STANDARD=20
      -DBUILD_TESTING=OFF
      -DCPPSORT_BUILD_TESTING=OFF
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end


  test do
  end
end
