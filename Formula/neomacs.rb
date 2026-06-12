# frozen_string_literal: true

class Neomacs < Formula
  desc "Modern Emacs rewritten in Rust with GPU acceleration"
  homepage "https://github.com/eval-exec/neomacs"
  url "https://github.com/eval-exec/neomacs/releases/download/v0.0.7/neomacs-0.0.7-aarch64-apple-darwin.tar.gz"
  sha256 "6551ee96f76c90f392e8d6eb3de561881c64aef13b9174e34b1d5d1b0ffc9d96"
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
    if OS.mac?
      # macOS structure: neomacs, neomacs.pdump, lisp/, etc/ at root
      bin.install "neomacs"
      # Install pdump to bin alongside the binary (required for standalone binary)
      bin.install "neomacs.pdump"
      pkgshare.install "lisp", "etc"
    else
      # Linux structure: bin/, share/neomacs/
      bin.install "bin/neomacs", "bin/neomacs.pdump"
      pkgshare.install Dir["share/neomacs/*"]
    end
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
