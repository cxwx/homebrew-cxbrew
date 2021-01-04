class Numcpp < Formula
  desc "C++ implementation of the Python Numpy library"
  homepage "https://github.com/dpilger26/NumCpp"
  url "https://github.com/dpilger26/NumCpp/archive/Version_2.1.0.tar.gz"
  version "2.1.0"


  depends_on "cmake" => [:build, :test]

  def install
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
