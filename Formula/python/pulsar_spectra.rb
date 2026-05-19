class PulsarSpectra < Formula
  include Language::Python::Virtualenv

  desc "Interface to record pulsar flux density measurements and fit spectral models"
  homepage "https://github.com/NickSwainston/pulsar_spectra"
  url "https://files.pythonhosted.org/packages/24/5f/60488dbdfba261817f6e6fad90bac65e9ac44c07cfc9b17dd1f088a371a6/pulsar_spectra-2.1.0.tar.gz"
  sha256 "f1df4f4ca2f71b4e0b6d91b0c2b9056299063ab067f6241f5cf51e65b4370328"
  license "MIT"

  depends_on "numpy"
  depends_on "python@3.14"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages("python3")/"homebrew-pulsar-spectra.pth").write venv.site_packages
  end

  test do
    system "python3", "-c", "import pulsar_spectra"
  end
end
