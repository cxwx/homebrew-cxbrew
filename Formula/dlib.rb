class Dlib < Formula
  desc "C++ library for machine learning"
  homepage "http://dlib.net/"
  url "https://github.com/davisking/dlib/archive/v19.20.tar.gz"
  head "https://github.com/davisking/dlib.git"

  depends_on "cmake" => :build
  depends_on "jpeg"
  depends_on "libpng"
  depends_on :macos => :el_capitan # needs thread-local storage
  depends_on "openblas"
  depends_on :x11

  def install
    ENV.cxx11

    args = std_cmake_args + %W[
      -DDLIB_USE_BLAS=ON
      -DDLIB_USE_LAPACK=ON
      -Dcblas_lib=#{Formula["openblas"].opt_lib}/libopenblas.dylib
      -Dlapack_lib=#{Formula["openblas"].opt_lib}/libopenblas.dylib
      -DUSE_SSE2_INSTRUCTIONS=ON
      -DUSE_AVX_INSTRUCTIONS=ON
      -DUSE_SSE4_INSTRUCTIONS=ON
      -DBUILD_SHARED_LIBS=ON
      -DDLIB_ISO_CPP_ONLY=OFF
    ]
    # -DDLIB_NO_GUI_SUPPORT=OFF

    args << "-DUSE_SSE4_INSTRUCTIONS=ON" if MacOS.version.requires_sse4?

    mkdir "dlib/build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <dlib/logger.h>
      dlib::logger dlog("example");
      int main() {
        dlog.set_level(dlib::LALL);
        dlog << dlib::LINFO << "The answer is " << 42;
      }
    EOS
    system ENV.cxx, "-std=c++11", "test.cpp", "-o", "test", "-I#{include}",
                    "-L#{lib}", "-ldlib"
    assert_match /INFO.*example: The answer is 42/, shell_output("./test")
  end
end
