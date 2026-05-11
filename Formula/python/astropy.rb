class Astropy < Formula
  include Language::Python::Virtualenv

  desc "Astronomy and astrophysics core library"
  homepage "https://www.astropy.org/"
  url "https://files.pythonhosted.org/packages/7b/92/2dce2d48347efc3346d08ca7995b152d242ebd170c571f7c9346468d8427/astropy-7.2.0.tar.gz"
  sha256 "ae48bc26b1feaeb603cd94bd1fa1aa39137a115fe931b7f13787ab420e8c3070"
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
