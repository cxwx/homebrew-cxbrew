class Argostranslate < Formula
  include Language::Python::Virtualenv

  desc "Open-source offline translation library written in Python"
  homepage "https://www.argosopentech.com"
  url "https://files.pythonhosted.org/packages/7a/0c/2887de7e72805eb37dac37cdd84132691c95b5842463b634bf86000d259a/argostranslate-1.11.0.tar.gz"
  sha256 "be43fa826cbac15399a33a90c842dfe504ad6b8fa55e252514e7071f5425b406"
  license "MIT"

  depends_on "python@3.14"
  depends_on "sentencepiece"

  def python3
    which("python3.14")
  end

  def install
    # setup.py reads requirements.txt which is missing from the sdist
    # TODO:next upgrade
    (buildpath/"requirements.txt").write <<~EOS
      ctranslate2>=4.0,<5
      sentencepiece>=0.2.0,<0.3
      spacy
      stanza==1.10.1
      packaging
      sacremoses>=0.0.53,<0.2
      minisbd
    EOS

    venv = virtualenv_create(libexec, python3)
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages(python3)/"homebrew-argostranslate.pth").write venv.site_packages
  end

  test do
    system python3, "-c", "import argostranslate; print(argostranslate.__version__)"
  end
end
