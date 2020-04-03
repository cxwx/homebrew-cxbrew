class SofaC < Formula
  desc "Standards of Fundamental Astronomy"
  homepage "http://www.iausofa.org/"
  url "http://www.iausofa.org/2019_0722_C/sofa_c-20190722.tar.gz"
  sha256 "a7063a140fdc78909f4d5ddf6b30143f9f60bfed7d5141047072515f51fa8647"

  def install
    cd "#{version}/c/src"
    system "make", "install", "INSTALL_DIR=#{prefix}"
  end

end
