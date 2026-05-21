class Pyyaml < Formula
  include Language::Python::Virtualenv

  desc "YAML parser and emitter for Python"
  homepage "https://pyyaml.org/"
  url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
  sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  license "MIT"

  depends_on "python@3.14"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages("python3")/"homebrew-pyyaml.pth").write venv.site_packages
  end

  test do
    system "python3", "-c", "import yaml; print(yaml.__version__)"
  end
end
