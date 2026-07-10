# frozen_string_literal: true

class Neomacs < Formula
  desc "Modern Emacs rewritten in Rust with GPU acceleration"
  homepage "https://github.com/eval-exec/neomacs"
  url "https://github.com/eval-exec/neomacs/archive/refs/tags/v0.0.11.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "GPL-3.0-only"
  head "https://github.com/eval-exec/neomacs.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/eval-exec/neomacs/releases/download/v#{version}/neomacs-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6551ee96f76c90f392e8d6eb3de561881c64aef13b9174e34b1d5d1b0ffc9d96"
    end

    on_intel do
      odie "Neomacs does not currently support Intel Macs. Please use Apple Silicon or Linux."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/eval-exec/neomacs/releases/download/v#{version}/neomacs-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e097fbfa99b068580f93b9b1fd6bfeb180440915601af6ca1e725bc946c50c3"
    end

    on_arm do
      url "https://github.com/eval-exec/neomacs/releases/download/v#{version}/neomacs-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14659c9d6a38118b95a55afde85a0963c7234b483187f2772e0bb7caca4fa5d5"
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
