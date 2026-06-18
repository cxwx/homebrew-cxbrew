# cspell:disable
class Xtensorfftw < Formula
  desc "xtensor-fftw"
  homepage "https://github.com/xtensor-stack/xtensor-fftw"
  url "https://github.com/xtensor-stack/xtensor-fftw/archive/refs/tags/0.2.6.tar.gz"
  sha256 "82d7492db4ae5593c2e419ddf1ece660ee315b269bc9e90176812e21d47bae3b"
  head "https://github.com/xtensor-stack/xtensor-fftw.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "xtensor"
  depends_on "fftw"
  # depends_on "xtl" already in xtensor


  def install
    # 上游 cmake_minimum_required < 3.5,新 CMake 移除了兼容,需放宽 policy 下限
    system "cmake", "-S", ".", "-B", "builddir", "-DCMAKE_POLICY_VERSION_MINIMUM=3.5", *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end


  test do
  end
end
