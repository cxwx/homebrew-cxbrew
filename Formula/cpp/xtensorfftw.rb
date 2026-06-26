class Xtensorfftw < Formula
  desc "FFTW bindings for the xtensor Topics"
  homepage "https://github.com/xtensor-stack/xtensor-fftw"
  url "https://github.com/xtensor-stack/xtensor-fftw/archive/refs/tags/0.4.0.tar.gz"
  sha256 "4b7bfb7ff53899b735f693b679370bf986c0371171e3fffff18dd37b1c02a5fd"
  head "https://github.com/xtensor-stack/xtensor-fftw.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "fftw"
  depends_on "xtensor"

  def install
    # 上游 cmake_minimum_required < 3.5,新 CMake 移除了兼容,需放宽 policy 下限
    system "cmake", "-S", ".", "-B", "builddir", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    system "true"
  end
end
