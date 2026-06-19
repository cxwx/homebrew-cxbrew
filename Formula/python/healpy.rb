class Healpy < Formula
  include Language::Python::Virtualenv

  desc "Healpix tools package for Python"
  homepage "https://github.com/healpy/healpy"
  url "https://files.pythonhosted.org/packages/e3/4e/6f5328f375f88c8c38314f24f82b7e1486ec0358c557779500382db1503c/healpy-1.19.0.tar.gz"
  sha256 "28e839cb885a23d36c77fc3423a3cb9271a07fda94085bd12fc329f941130ec5"
  license "GPL-2.0-only"

  depends_on "cmake" => :build
  depends_on "cython" => :build
  depends_on "numpy" => :build
  depends_on "astropy"
  depends_on "cfitsio"
  depends_on "healpix"
  depends_on "numpy"
  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages(python3)/"homebrew-healpy.pth").write venv.site_packages
  end

  test do
    system python3, "-c", "import healpy; print(healpy.__version__)"
  end
end
