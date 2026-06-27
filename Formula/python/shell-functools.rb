class ShellFunctools < Formula
  include Language::Python::Virtualenv

  desc "Functional programming tools for the shell"
  homepage "https://github.com/sharkdp/shell-functools"
  url "https://files.pythonhosted.org/packages/d8/20/44d68070637ed02a176068b4c028438b4a65b0f4bf95b72e1720f62a98ae/shell_functools-0.3.1.tar.gz"
  sha256 "821423f10f034de09303cdb2739ccf381d93697bf52763fcff8b0e4058336456"
  license "MIT"
  head "https://github.com/sharkdp/shell-functools.git", branch: "main"

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
    assert_match "False\nTrue\nFalse", shell_output("printf '1\\n2\\n3\\n' | #{bin}/map 'even'")
  end
end
