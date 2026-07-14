class Astropy < Formula
  include Language::Python::Virtualenv

  desc "Astronomy and astrophysics core library"
  homepage "https://www.astropy.org/"
  url "https://files.pythonhosted.org/packages/0e/c4/21be4313ddfde5f60e0607fd307f367b9e0f0bf153a89b10cbd036dd8cfd/astropy-8.0.1.tar.gz"
  sha256 "45ca31d5b91fa294cd590a4791a32db94de7f9c8a343155f4d5877baa82351da"
  license "BSD-3-Clause"

  depends_on "cfitsio" => :build
  depends_on "cmake" => :build
  depends_on "cython" => :build
  depends_on "ninja" => :build
  depends_on "numpy" => :build
  depends_on "erfa"
  depends_on "numpy"
  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  resource "astropy-iers-data" do
    url "https://files.pythonhosted.org/packages/7f/e3/d32d2401c53fa1aaf118c963c51c4eb9cd10d074a72a52430904dc8ef46e/astropy_iers_data-0.2026.7.6.1.1.20.tar.gz"
    sha256 "bc38de235802c9f006c8a04693706e2adcc9e7ac1cbf415dc042b5f0ac14f1f3"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/22/fd/89965aa4ac08c74998539fcbf24fa3540f3e15237fbeb6bcf9c908f4aade/numpy-2.5.1.tar.gz"
    sha256 "a48a113e6afea91f5608793bafa7ef2ad481fefbda87ec5069f483de61cb9fa3"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/d7/f1/e7a6dd94a8d4a5626c03e4e99c87f241ba9e350cd9e6d75123f992427270/packaging-26.2.tar.gz"
    sha256 "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
  end

  resource "pyerfa" do
    url "https://files.pythonhosted.org/packages/71/39/63cc8291b0cf324ae710df41527faf7d331bce573899199d926b3e492260/pyerfa-2.0.1.5.tar.gz"
    sha256 "17d6b24fe4846c65d5e7d8c362dcb08199dc63b30a236aedd73875cc83e1f6c0"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages(python3)/"homebrew-astropy.pth").write venv.site_packages
  end

  test do
    system python3, "-c", "import astropy; print(astropy.__version__)"
  end
end
