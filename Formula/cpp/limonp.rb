class Limonp < Formula
  desc "C++ headers(hpp) library with Python style"
  homepage "https://github.com/yanyiwu/limonp"
  url "https://github.com/yanyiwu/limonp/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "c7b18794f020dbaa1006229b49a39217a463da0cb3586aee83eb7471f4ae71df"
  license "MIT"
  head "https://github.com/yanyiwu/limonp.git", branch: "master"

  depends_on "cmake" => :build
  # depends_on "googletest" => :build  # BUG:

  def install
    args = %w[
      -DENABLE_UNIT_TESTS=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do  # TODO:
    (testpath/"test.cpp").write <<~CPP
    CPP
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["fmt"].opt_lib/"pkgconfig"
    cxxflags = shell_output("pkg-config --cflags fmt").strip
    ldflags = shell_output("pkg-config --libs fmt").strip
    system ENV.cxx, "test.cpp", "-std=c++11", "-o", "test", *cxxflags.split, *ldflags.split
    system "./test"
  end
end
