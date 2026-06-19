class Iminuit < Formula
  include Language::Python::Virtualenv

  desc "Jupyter-friendly Python frontend for MINUIT2 in C++"
  homepage "https://scikit-hep.org/iminuit"
  url "https://files.pythonhosted.org/packages/e8/0d/48a09d00769634930b1bdbf1ea057a2747a81d07825cd6940784d8b6599f/iminuit-2.32.0.tar.gz"
  sha256 "a32b34d18665959be75ad6bdb1dd80459bb94466c62b455631c00568accdf7d2"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "pybind11" => :build
  depends_on "numpy"
  depends_on "python@3.14"

  def python3
    which("python3.14")
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
