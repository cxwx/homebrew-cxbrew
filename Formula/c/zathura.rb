class Zathura < Formula
  desc "Document viewer"
  homepage "https://pwmt.org/projects/zathura"
  url "https://github.com/pwmt/zathura/archive/refs/tags/2026.10.4.tar.gz"
  sha256 "82acff794947fb919fd80ed26de87cf803297ea0dc6e846d1308b11c1d0dba3c"
  license "zlib"

  depends_on "gcc" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "cairo"
  depends_on "gettext"
  depends_on "girara"
  depends_on "glib"
  depends_on "gtk4"
  depends_on "json-glib"
  depends_on "libmagic"
  depends_on "sqlite"
  depends_on "xxhash"

  def install
    # Build with Homebrew GCC everywhere: Clang rejects zathura's `goto`
    # across g_autofree (__attribute__((cleanup))) variables, and C23's
    # <stdckdint.h> (ckd_mul, new in 2026.07.18) needs GCC >= 14.
    ENV["CC"] = (formula_opt_bin("gcc")/"gcc-#{Formula["gcc"].version.major}").to_s

    # gettext 1.0 hides the AppStream ITS rules from msgfmt, breaking the
    # metainfo translation merge; install the file untranslated instead.
    inreplace "data/meson.build" do |s|
      s.gsub! "appdata = i18n.merge_file(", "appdata = configure_file("
      s.gsub! "  po_dir: podir,\n)", "  copy: true,\n)"
    end

    # Upstream targets C23; older toolchains only spell the dialect `c2x`/`gnu2x`.
    system "meson", "setup", "build", "-Dc_std=gnu2x", "-Dsynctex=disabled", "-Dseccomp=disabled",
           "-Dlandlock=disabled", "-Dmanpages=disabled", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end

  test do
    system "#{bin}/zathura", "--version"
  end
end
