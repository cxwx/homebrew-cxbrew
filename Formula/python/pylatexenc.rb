class Pylatexenc < Formula
  include Language::Python::Virtualenv

  desc "LaTeX parsing and conversion tools"
  homepage "https://github.com/phfaist/pylatexenc"
  url "https://files.pythonhosted.org/packages/5d/ab/34ec41718af73c00119d0351b7a2531d2ebddb51833a36448fc7b862be60/pylatexenc-2.10.tar.gz"
  sha256 "3dd8fd84eb46dc30bee1e23eaab8d8fb5a7f507347b23e5f38ad9675c84f40d3"
  license "MIT"
  head "https://github.com/phfaist/pylatexenc.git", branch: "main"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "usage", shell_output("#{bin}/latex2text --help")
  end
end
