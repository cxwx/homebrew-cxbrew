class Bitmapplusplus < Formula
  desc "Simple and Fast single header Bitmap (BMP) C++ library"
  homepage "https://github.com/baderouaich/BitmapPlusPlus"
  url "https://github.com/baderouaich/BitmapPlusPlus/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "dd1ca714c0b1a99f7738f3e340016982409987388348e1378e1b06bc6eaa3c15"
  head "https://github.com/baderouaich/BitmapPlusPlus.git", branch: "master"

  def install
    include.install "lib/include/BitmapPlusPlus.hpp"
  end
end
