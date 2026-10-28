class Pylatexenc < Formula
  include Language::Python::Virtualenv

  desc "LaTeX parsing and conversion tools"
  homepage "https://github.com/phfaist/pylatexenc"
  url "https://files.pythonhosted.org/packages/52/45/ddb0fb04acf95fe9cf9c369814dbdd08651bd2c9ee455f142651e06f4488/pylatexenc-2.11.tar.gz"
  sha256 "305a072a99ce736246049c9da05841b9d718c0f7ea8888f5f596cf15cb621053"
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
