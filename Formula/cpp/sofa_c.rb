class SofaC < Formula
  desc "Standards of Fundamental Astronomy"
  homepage "http://www.iausofa.org/"
  url "https://www.iausofa.org/2023_1011_C/sofa_c-20231011.tar.gz"
#  version "20210125_a"

  def install
    cd "#{version}/c/src"
    system "sed", "-i.bak", "s/ar ru/gcc -fPIC -dynamiclib -o/g", "makefile"
    system "make", "install", "INSTALL_DIR=#{prefix}", "SOFA_LIB_NAME=libsofa_c.dylib"
  end
end
