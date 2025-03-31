class Flashlight < Formula
  desc "C++ standalone library for machine learning"
  homepage "https://github.com/flashlight/flashlight"
  # url ""
  license "MIT"
  head "https://github.com/flashlight/flashlight.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "arrayfire"

  def install
    args = %w[
      -DFL_ARRAYFIRE_USE_OPENCL=ON
      -DFL_USE_ONEDNN=OFF
      -DFL_BUILD_TESTS=OFF
      -DFL_BUILD_EXAMPLES=OFF
      -DFL_BUILD_SCRIPTS=OFF
      -DFL_BUILD_DISTRIBUTED=OFF
      -DBUILD_SHARED_LIBS=ON
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
    // --TODO: BUG
      #include <flashlight/fl/flashlight.h>

      int main() {
        fl::init();
        fl::Variable v(fl::full({1}, 1.), true);
        auto result = v + 10;
        std::cout << "Tensor value is " << result.tensor() << std::endl; // 11.000
        return 0;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++20", "-L#{lib}", "-o", "test"
    assert_equal "{\"name\":\"tom\",\"age\":28}", shell_output("./test").chomp
  end
end
