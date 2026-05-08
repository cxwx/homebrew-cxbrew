class EmceeCpp < Formula
  desc "Cpp version of emcee"
  homepage "https://github.com/cxwx/emcee-cpp"
  url "https://github.com/cxwx/emcee-cpp/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "73948c1dea627ec730935484e3bcd5d9f6cf49cf8313831f707752b35c09b172"
  license "MIT"
  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
