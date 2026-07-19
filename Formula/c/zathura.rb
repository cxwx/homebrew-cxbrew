class Zathura < Formula
  desc "Document viewer"
  homepage "https://pwmt.org/projects/zathura"
  url "https://github.com/pwmt/zathura/archive/refs/tags/2026.07.18.tar.gz"
  sha256 "737911eaf3ff7047004e0cb68548365313f072c3522b89efa0e4b7a036730b80"
  license "zlib"

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

  on_macos do
    # zathura jumps `goto` across g_autofree (__attribute__((cleanup))) variables,
    # which Clang rejects; build with GCC instead.
    depends_on "gcc" => :build
  end

  def install
    ENV["CC"] = (formula_opt_bin("gcc")/"gcc-#{Formula["gcc"].version.major}").to_s if OS.mac?

    # Upstream ships a stray </issue> where </p> is meant in the release notes.
    inreplace "data/org.pwmt.zathura.metainfo.xml.in",
              "test-wayland features</issue>",
              "test-wayland features</p>"
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
