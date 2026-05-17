class Pyunfold < Formula
  include Language::Python::Virtualenv

  desc "Python package for iterative unfolding"
  homepage "https://github.com/jrbourbeau/pyunfold"
  url "https://files.pythonhosted.org/packages/37/d9/590cfd205fb6fb4f17e9d04ede047c599669381114177b6c66c6d2921ee7/PyUnfold-0.5.0.tar.gz"
  sha256 "d3e7d7da9fa03d218b117780e8f6894f2fba1452f6f8e1cab1e556e46242d980"
  license "MIT"

  depends_on "python@3.14"

  def python3
    which("python3")
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages(python3)/"homebrew-pyunfold.pth").write venv.site_packages
  end

  test do
    system python3, "-c", "import pyunfold"
  end
end
