class Iminuit < Formula
  include Language::Python::Virtualenv

  desc "Jupyter-friendly Python frontend for MINUIT2 in C++"
  homepage "https://scikit-hep.org/iminuit"
  url "https://files.pythonhosted.org/packages/42/d0/e31af328165497a569e403cbf5545fce7899be5c43a20ff3f23f2753185d/iminuit-2.33.0.tar.gz"
  sha256 "275f3daa1d4f8c33579b96276d7c5fb680a7cfb6fb8bea9a4245a1500d5d328b"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "pybind11" => :build
  depends_on "numpy"
  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/13/01/11703282db468b85f6f7b8c7f22d058de5970d5c7e60a3a8aaa313c3de36/numpy-2.5.3.tar.gz"
    sha256 "df2d5874ff183595a4ba404edd04f6bd9b5505c1d7708573f6a6c17489a67563"
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages(python3)/"homebrew-iminuit.pth").write venv.site_packages
  end

  test do
    system python3, "-c", "import iminuit; print(iminuit.__version__)"
  end
end
