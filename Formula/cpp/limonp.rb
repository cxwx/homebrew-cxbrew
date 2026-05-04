class Limonp < Formula
  desc "C++ headers(hpp) library with Python style"
  homepage "https://github.com/yanyiwu/limonp"
  url "https://github.com/yanyiwu/limonp/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "0d98bd9c87bd82bcfc234107908969e7416145d8b5e996e43c5d2513c419b2c0"
  license "MIT"
  head "https://github.com/yanyiwu/limonp.git", branch: "master"

  depends_on "cmake" => :build

  def install
    args = %w[
      -DENABLE_UNIT_TESTS=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do # TODO(CX): test
    (testpath/"test.cpp").write <<~CPP
      #include <iostream>
      int main() { return 0; }
    CPP
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["fmt"].opt_lib/"pkgconfig"
    cxxflags = shell_output("pkg-config --cflags fmt").strip
    ldflags = shell_output("pkg-config --libs fmt").strip
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test", *cxxflags.split, *ldflags.split
    system "./test"
  end
end
