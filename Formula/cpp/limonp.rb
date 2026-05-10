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

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <limonp/StringUtil.hpp>
      #include <limonp/Logging.hpp>
      using namespace std;
      #define print(x) std::cout << x << std::endl
      int main() {
        string str;
        str = limonp::StringFormat("%s, %s", "hello", "world");
        print(str); //hello, world
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++17", "-o", "test"
    system "./test"
  end
end
