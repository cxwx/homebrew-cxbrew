class Argh < Formula
  desc "minimalist argument handler"
  homepage "https://github.com/adishavit/argh"
  url "https://github.com/adishavit/argh/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "4b76d8c55e97cc0752feee4f00b99dc58464dd030dea9ba257c0a7d24a84f9dd"
  license "BSD-3-Clause"
  head "https://github.com/adishavit/argh.git", branch: "master"

  depends_on "cmake" => :build

  uses_from_macos "python" => :build

  def install
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
  end
end
