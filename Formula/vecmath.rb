class Vecmath < Formula
  desc "A collection of vectorized based math utilities based on VecCore library"
  homepage "https://github.com/root-project/vecmath"
  url "https://codeload.github.com/root-project/vecmath/tar.gz/master"
  version "0.1.0"

  depends_on "cmake" => :build
  depends_on "vc"
  depends_on "vdt"

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
