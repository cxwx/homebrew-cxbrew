class Veccore < Formula
  desc "C++ Library for Portable SIMD Vectorization"
  homepage "https://github.com/root-project/veccore"
  url "https://github.com/root-project/veccore/archive/v0.6.0.tar.gz"

  depends_on "cmake" => :build
  depends_on "vc"
  depends_on "umesimd"
  depends_on "root"

  def install
    mkdir "builddir" do
      args = std_cmake_args + %w[
        ../
        -DROOT=ON
        -DBACKEND=Vc
        -DVc_DIR=/usr/local/lib/cmake/Vc/
        -DBUILD_SHARED_LIBS=ON
      ]
      system "cmake", *args
      system "make", "install"
    end
  end

end
