class Tqdm < Formula
  include Language::Python::Virtualenv

  desc "Fast, extensible progress bar for Python"
  homepage "https://tqdm.github.io"
  url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
  sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  license "MIT"

  depends_on "python@3.14"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages("python3")/"homebrew-tqdm.pth").write venv.site_packages
  end

  test do
    system "python3", "-c", "import tqdm; print(tqdm.__version__)"
  end
end
