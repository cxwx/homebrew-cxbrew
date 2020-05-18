class Crmc < Formula
  desc "Cosmic Ray Monte Carlo"
  homepage "https://devel-ik.fzk.de/wsvn/mc/crmc/"
  url "https://github.com/alisw/crmc/archive/v1.7.0.tar.gz"
  sha256 "59086f4e654d775a4f6c3974ae89bbfd995391c4677f266881604878b47563d1"

  depends_on "cmake" => :build
  depends_on "gcc" 

  def install
    mkdir "../build" do
      args = %W[
        -DCMAKE_INSTALL_PREFIX=#{prefix}
        -D__CRMCSTATIC__=ON
      ]
      system "cmake", buildpath, *args
      system "make"
      system "make", "install"
    end
  end

end
