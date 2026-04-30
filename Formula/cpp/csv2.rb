# cspell:disable
class Csv2 < Formula
  desc "Fast CSV parser and writer for Modern C++"
  homepage "https://github.com/p-ranav/csv2"
  url "https://github.com/p-ranav/csv2/archive/refs/tags/v0.1.tar.gz"
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
