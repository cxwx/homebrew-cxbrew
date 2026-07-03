class Zathura < Formula
  desc "Document viewer"
  homepage "https://pwmt.org/projects/zathura"
  url "https://github.com/pwmt/zathura/archive/refs/tags/2026.07.02.tar.gz"
  sha256 "67386e3a9a8b5179a8fb2f443d42301108587227036fb05a1fb6fa1fa8f00b79"
  license "zlib"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "gettext"
  depends_on "girara"
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "json-glib"
  depends_on "libmagic"
  depends_on "sqlite"

  on_macos do
    depends_on "gtk-mac-integration"
  end

  def install
    system "meson", "setup", "build", "-Dsynctex=disabled", "-Dseccomp=disabled",
           "-Dlandlock=disabled", "-Dmanpages=disabled", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end

  test do
    system "#{bin}/zathura", "--version"
  end
end
