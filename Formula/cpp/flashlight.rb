# TODO: build failed 17->20
class Flashlight < Formula
  desc "C++ standalone library for machine learning"
  homepage "https://github.com/flashlight/flashlight"
  license "MIT"
  head "https://github.com/flashlight/flashlight.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "arrayfire"

  def install
    # Upstream hardcodes C++17 but uses C++20 features (contains())
    inreplace "CMakeLists.txt", "set(CMAKE_CXX_STANDARD 17)", "set(CMAKE_CXX_STANDARD 20)"

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
      #include <flashlight/fl/tensor/TensorBase.h>
      int main() {
        auto t = fl::full({3, 3}, 1.0);
        return t.shape()[0] == 3 ? 0 : 1;
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++20", "-I#{include}", "-L#{lib}", "-lflashlight", "-o", "test"
    system "./test"
  end
end
