class SofaC < Formula
  desc "Standards of Fundamental Astronomy"
  homepage "http://www.iausofa.org/"
  url "http://www.iausofa.org/2020_0721_C/sofa_c-20200721.tar.gz"
  version "20200721"

  def install
    cd "#{version}/c/src"
    system "sed -i'.bak' 's/ar ru/gcc -fPIC -dynamiclib -o/g' makefile "
    system "make", "install", "INSTALL_DIR=#{prefix}", "SOFA_LIB_NAME=libsofa_c.dylib"
  end
end
