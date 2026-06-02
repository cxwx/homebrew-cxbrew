class Md2typst < Formula
  include Language::Python::Virtualenv

  desc "Markdown to Typst converter with multiple parser support"
  homepage "https://git.sr.ht/~sfermigier/md2typst"
  url "https://files.pythonhosted.org/packages/8e/11/9f2b942464044181437cc013c99a67d7e0634f528bb16b4f09e2b8669b70/md2typst-0.3.5.tar.gz"
  sha256 "df8d4b4e5bac9baa653873e64226fb6878611e984915ceba79f2910be6c4712e"
  license "MIT"

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  def std_pip_args(prefix: self.prefix, build_isolation: false)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--uploaded-prior-to=#{(Time.now.utc - (24 * 60 * 60)).iso8601(0)}"
    args << "--prefix=#{prefix}" if prefix
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages(python3)/"homebrew-md2typst.pth").write venv.site_packages
  end

  test do
    system python3, "-c", "import md2typst; from importlib.metadata import version; print(version('md2typst'))"
    system bin/"md2typst", "--help"
  end
end
