# frozen_string_literal: true

class Neomacs < Formula
  desc "Modern Emacs rewritten in Rust with GPU acceleration"
  homepage "https://github.com/eval-exec/neomacs"
  version "0.0.13"
  license "GPL-3.0-only"
  head "https://github.com/eval-exec/neomacs.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/eval-exec/neomacs/releases/download/v#{version}/neomacs-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "69f1729a34f4b7d3006c3b535a8beb9268256a43d1368fa15532ead62e6e17dd"
    end

    on_intel do
      odie "Neomacs does not currently support Intel Macs. Please use Apple Silicon or Linux."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/eval-exec/neomacs/releases/download/v#{version}/neomacs-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e369edb3cd89140fd21d661db5221e8051f9afca0aafe6893a5d070af693551"
    end

    on_arm do
      url "https://github.com/eval-exec/neomacs/releases/download/v#{version}/neomacs-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5fa65d9c9d95b3358c215a40f05b2fec36146ca004beba134cbb55620d064bdf"
    end
  end

  def install
    # pdump 是数据文件,不能进 bin/(brew audit 要求 bin 下都是可执行)。
    # 而 standalone binary 运行时需与 pdump 同目录,故 binary+pdump 都放 libexec/,
    # bin 仅放 symlink(binary 经 realpath 找到 libexec 下的 pdump)。
    if OS.mac?
      # macOS structure: neomacs, neomacs.pdump, lisp/, etc/ at root
      libexec.install "neomacs", "neomacs.pdump"
      pkgshare.install "lisp", "etc"
    else
      # Linux structure: bin/, share/neomacs/
      libexec.install "bin/neomacs", "bin/neomacs.pdump"
      pkgshare.install Dir["share/neomacs/*"]
    end
    bin.install_symlink libexec/"neomacs"
  end

  def caveats
    <<~EOS
      Neomacs is in active alpha development. Expect rough edges and breaking changes.

      For more information: https://github.com/eval-exec/neomacs
    EOS
  end

  test do
    system bin/"neomacs", "--version"
  end
end
