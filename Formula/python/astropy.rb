class Astropy < Formula
  include Language::Python::Virtualenv

  desc "Astronomy and astrophysics core library"
  homepage "https://www.astropy.org/"
  url "https://files.pythonhosted.org/packages/94/d2/d2081156845793570dede8454cbe312dec7f337a842b437d00f48d65ecf4/astropy-8.0.0.tar.gz"
  sha256 "7f4de5db41f26f140433eddd78458abfc1c19b8037f9f8a89c33853cfba1fdc3"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "cython" => :build
  depends_on "numpy" => :build
  depends_on "cfitsio" => :build
  depends_on "erfa"
  depends_on "numpy"
  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages(python3)/"homebrew-astropy.pth").write venv.site_packages
  end

  test do
    system python3, "-c", "import astropy; print(astropy.__version__)"
  end
end
