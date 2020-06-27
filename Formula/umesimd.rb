class Umesimd < Formula
  desc "An explicit vectorization library"
  homepage "https://github.com/edanor/umesimd"
  url "https://github.com/edanor/umesimd/archive/v0.8.1.tar.gz"

  depends_on "cmake" => :build

  def install
    mkdir "builddir" do
      args = std_cmake_args + %w[
        ../
        -DBUILD_SHARED_LIBS=ON
      ]
      system "cmake", *args
      system "make", "install"
    end
  end

end
