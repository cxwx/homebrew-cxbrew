class PythonEmcee < Formula
  include Language::Python::Virtualenv

  desc "Python ensemble sampling toolkit for MCMC"
  homepage "https://emcee.readthedocs.io"
  url "https://files.pythonhosted.org/packages/cb/53/1045ee878cb24281387079f8ee4f0ade1622c6aae1ed1fd91a53e4fa5b19/emcee-3.1.6.tar.gz"
  sha256 "11af4daf6ab8f9ca69681e3c29054665db7bbd87fd4eb8e437d2c3a1248c637d"
  license "MIT"

  depends_on "numpy"
  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    system libexec/"bin/python", "-c", "import emcee; print(emcee.__version__)"
  end
end
