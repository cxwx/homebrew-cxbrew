class Cppjieba < Formula
  desc "'结巴'中文分词的C++版本 "
  homepage "https://github.com/yanyiwu/cppjieba"
  url "https://github.com/yanyiwu/cppjieba/archive/refs/tags/v5.6.7.tar.gz"
  sha256 "08322f7c2a06a88e52eb0fdbc286ec86a85abae5b2a33b1e1430dba50b71960e"
  license "MIT"
  head "https://github.com/yanyiwu/cppjieba.git", branch: "master"

  # depends_on "cmake" => :build
  # depends_on "fmt" => :test
  # depends_on "pkgconf" => :test

  def install
    args = %w[
    ]

    # system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    # system "cmake", "--build", "builddir"
    # system "cmake", "--install", "builddir"
    include.install "include/cppjieba"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
    CPP
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["fmt"].opt_lib/"pkgconfig"
    cxxflags = shell_output("pkg-config --cflags fmt").strip
    ldflags = shell_output("pkg-config --libs fmt").strip
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test", *cxxflags.split, *ldflags.split
    system "./test"
  end
end
