class Cppjieba < Formula
  desc "'结巴'中文分词的C++版本 "
  homepage "https://github.com/yanyiwu/cppjieba"
  url "https://github.com/yanyiwu/cppjieba/archive/refs/tags/v5.6.0.tar.gz"
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
