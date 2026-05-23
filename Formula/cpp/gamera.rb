class Gamera < Formula
  desc "Spectral modelling of non-thermally emitting astrophysical sources"
  homepage "https://github.com/cxwx/GAMERA"
  license "LGPL-2.1-or-later"
  head "https://github.com/cxwx/GAMERA.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "gsl"

  def install
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
end
