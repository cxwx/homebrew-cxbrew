class Vc < Formula
  desc "portable, zero-overhead C++ types for explicitly data-parallel programming"
  homepage "https://github.com/VcDevel/Vc"
  url "https://github.com/VcDevel/Vc/releases/download/1.4.1/Vc-1.4.1.tar.gz"
  version "1.4.1"
  sha256 "68e609a735326dc3625e98bd85258e1329fb2a26ce17f32c432723b750a4119f"
  head "https://github.com/VcDevel/Vc"

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
