class Veccore < Formula
  desc "C++ Library for Portable SIMD Vectorization"
  homepage "https://github.com/root-project/veccore"
  url "https://github.com/root-project/veccore/archive/v0.7.0.tar.gz"

  depends_on "cmake" => :build
#  depends_on "root"
  depends_on "umesimd"
  depends_on "vc"

  def install
    mkdir "builddir" do
      args = std_cmake_args + %w[
        ../
        -DBACKEND=Vc
        -DVc_DIR=/usr/local/lib/cmake/Vc/
        -DBUILD_SHARED_LIBS=ON
      ]
        #-DROOT=ON
      system "cmake", *args
      system "make", "install"
    end
  end
end
