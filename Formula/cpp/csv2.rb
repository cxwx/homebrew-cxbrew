# cspell:disable
class Csv2 < Formula
  desc "Fast CSV parser and writer for Modern C++"
  homepage "https://github.com/p-ranav/csv2"
  url "https://github.com/p-ranav/csv2/archive/refs/tags/v0.1.tar.gz"
  sha256 "e185d0378a95edb2ad0f2473970d8fe8579c87326640340d42bdf6327fd96791"
  head "https://github.com/p-ranav/csv2", branch: "main"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
