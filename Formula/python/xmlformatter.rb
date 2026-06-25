class Xmlformatter < Formula
  include Language::Python::Virtualenv

  desc "Format and compress XML documents"
  homepage "https://github.com/pamoller/xmlformatter"
  url "https://files.pythonhosted.org/packages/8e/3c/c82fe32478256a1d6cfae4770eda5e4da629e56f7d5a2baace308819c910/xmlformatter-0.2.9.tar.gz"
  sha256 "22266ce398950d7848df66d5edc1bee57ead6d1b2404184c335ac4d0892d2760"
  license "MIT"
  head "https://github.com/pamoller/xmlformatter.git", branch: "master"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  def install
    virtualenv_create(libexec, python3).pip_install_and_link buildpath
  end

  test do
    assert_equal "<root>\n  <a>1</a>\n</root>",
                 pipe_output("#{bin}/xmlformat -", "<root><a>1</a></root>")
  end
end
