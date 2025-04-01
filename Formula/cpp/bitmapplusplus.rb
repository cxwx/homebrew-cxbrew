class Bitmapplusplus < Formula
  desc "Simple and Fast single header Bitmap (BMP) C++ library"
  homepage "https://github.com/baderouaich/BitmapPlusPlus"
  head "https://github.com/baderouaich/BitmapPlusPlus.git", branch: "master"

  def install
    include.install "lib/include/BitmapPlusPlus.hpp"
  end
end
