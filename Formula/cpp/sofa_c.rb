class SofaC < Formula
  desc "Standards of Fundamental Astronomy"
  homepage "http://www.iausofa.org/"
  url "https://www.iausofa.org/s/sofa_c-20231011tar.gz"
  sha256 "d9c10833cae8b4d9361a0ffda31ec361fd1262362025bec4d4e51a880150ace2"

  def install
    cd "20231011/c/src"
    system "sed", "-i.bak", "s/ar ru/gcc -fPIC -dynamiclib -o/g", "makefile"
    system "make", "install", "INSTALL_DIR=#{prefix}", "SOFA_LIB_NAME=libsofa_c.dylib"
  end
end
