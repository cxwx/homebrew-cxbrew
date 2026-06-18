class SofaC < Formula
  desc "Standards of Fundamental Astronomy"
  homepage "http://www.iausofa.org/"
  url "https://static1.squarespace.com/static/68caa251ae552a6213e8764b/t/68d3f1e498fb781111a023da/1758720484117/sofa_c-20231011.tar.gz"
  sha256 "d9c10833cae8b4d9361a0ffda31ec361fd1262362025bec4d4e51a880150ace2"
  # SOFA 用日期版本,上游官网记法为 2023-10-11;url 文件名/tarball 目录紧凑为 20231011。
  # 这里显式 version 用带横线记法以与 livecheck(官网页面)对齐。
  version "2023-10-11"

  livecheck do
    url "http://www.iausofa.org/current-software"
    regex(%r{href="/(\d{4}-\d{2}-\d{2})c"}i)
  end

  def install
    cd "#{version.to_s.delete('-')}/c/src" do
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
