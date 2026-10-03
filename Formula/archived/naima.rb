class Naima < Formula
  include Language::Python::Virtualenv

  desc "Derivation of non-thermal particle distributions through MCMC spectral fitting"
  homepage "https://github.com/zblz/naima"
  url "https://files.pythonhosted.org/packages/cf/f3/ac5937e0d7a27bfc2d7e4b4caf62e25688e4e6834a68c7c347befafce66f/naima-0.10.3.tar.gz"
  sha256 "3e86de6d9114ae9c683b3ae311451d1de6e9d9574f923b7b133a86d1dac7e39b"
  license "BSD-3-Clause"

  depends_on "numpy"
  depends_on "python@3.14"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages("python3")/"homebrew-naima.pth").write venv.site_packages
  end

  test do
    system "python3", "-c", "import naima"
  end
end
