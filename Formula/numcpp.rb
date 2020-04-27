class Numcpp < Formula
  desc "C++ implementation of the Python Numpy library"
  homepage "https://github.com/dpilger26/NumCpp"
  url "https://github.com/dpilger26/NumCpp/archive/master.tar.gz"
  version "1.3"


  depends_on "cmake" => [:build, :test]

  def install
    cd "install" do
      mkdir "build" do
        args = std_cmake_args + %w[
          ../
          -DCMAKE_BUILD_TYPE=Release
        ]

        system "cmake", *args
        system "make", "install"
      end
    end
  end
end
