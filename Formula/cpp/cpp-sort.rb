# cspell:disable
class CppSort < Formula
  desc "Sorting algorithms & related tools for C++14"
  homepage "https://github.com/Morwenn/cpp-sort"
  url "https://github.com/Morwenn/cpp-sort/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "c097a17c895fa684b92f6af45e8464e7179f0d73145826942add09daa5ca0c22"
  head "https://github.com/Morwenn/cpp-sort.git", branch: "main" # BUG: no main nor master branch

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DCMAKE_CXX_STANDARD=20
      -DBUILD_TESTING=OFF
      -DCPPSORT_BUILD_TESTING=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    system "true"
  end
end
