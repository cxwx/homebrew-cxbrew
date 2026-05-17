class SofaC < Formula
  desc "Standards of Fundamental Astronomy"
  homepage "http://www.iausofa.org/"
  url "https://static1.squarespace.com/static/68caa251ae552a6213e8764b/t/68d3f1e498fb781111a023da/1758720484117/sofa_c-20231011.tar.gz"
  sha256 "d9c10833cae8b4d9361a0ffda31ec361fd1262362025bec4d4e51a880150ace2"

  def install
    cd "20231011/c/src" do
      # Original makefile uses `ar ru` to build static library.
      # Replace with shared library build for both macOS and Linux.
      inreplace "makefile", "ar ru", "gcc -fPIC -shared -o"

      if OS.mac?
        arch = "x86_64"
        case Hardware::CPU.arch
        when :arm64
          arch = "arm64"
        end
        system "make", "install", "INSTALL_DIR=#{prefix}", "SOFA_LIB_NAME=libsofa_c.dylib"
      else
        system "make", "install", "INSTALL_DIR=#{prefix}", "SOFA_LIB_NAME=libsofa_c.so"
      end
    end
  end
end
