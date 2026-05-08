class EmceeCpp < Formula
  desc "Cpp version of emcee"
  homepage "https://github.com/cxwx/emcee-cpp"
  url "https://github.com/cxwx/emcee-cpp/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "789c0f51af4ba3b6c33607ec3e23e8c5c9ddb4378261cf68ba584ff3c7c4b2f8"
  license "MIT"
  depends_on "cmake" => :build
  depends_on "eigen@3"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "false"
  end
end
