class Pyunfolding < Formula
  include Language::Python::Virtualenv

  desc "Unfolding framework in Python"
  homepage "https://github.com/thoinka/pyunfolding"

  license "MIT"

  head "https://github.com/thoinka/pyunfolding.git", branch: "master"

  depends_on "ipython"
  depends_on "python@3.14"

  def python3
    which("python3")
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages(python3)/"homebrew-pyunfolding.pth").write venv.site_packages
  end

  def caveats
    <<~TEXT
      not worked now(py3.14 .. )
      No module named 'IPython'
    TEXT
  end

  test do
    system python3, "-c", "import pyunfolding"
  end
end
