class Textlsp < Formula
  include Language::Python::Virtualenv

  desc "Language server for text spell and grammar check with various tools"
  homepage "https://github.com/hangyav/textLSP"
  url "https://files.pythonhosted.org/packages/c1/67/b385039bf0faada3ec4d43d9da47c5c05cb09ba74dba06c3a0d76211c266/textlsp-0.4.0.tar.gz"
  sha256 "5867275812f9314c3c9e21c63b33a07a1acfa6ef58db04e461f7160ae98029b3"
  license "GPL-3.0-only"
  head "https://github.com/hangyav/textLSP.git", branch: "main"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  # textLSP pins its runtime dependencies (pygls, language-tool-python,
  # tree_sitter, openai, ollama, ...), so install them and use prebuilt wheels
  # instead of the default dependency-free, source-only build.
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    # Only expose textlsp; its dependencies also install console scripts
    # (httpx, openai, tqdm, ...) that would collide with other formulae.
    bin.install_symlink libexec/"bin/textlsp"
  end

  test do
    assert_match "usage: textlsp", shell_output("#{bin}/textlsp --help")
  end
end
