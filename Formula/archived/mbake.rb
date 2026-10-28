class Mbake < Formula
  include Language::Python::Virtualenv

  desc "Makefile formatter and linter"
  homepage "https://github.com/EbodShojaei/bake"
  url "https://files.pythonhosted.org/packages/27/7a/71331f29bfe3fa4c312d05556759e9aacb7f9fa90f5f39aaaa9de46bd995/mbake-1.4.6.tar.gz"
  sha256 "31b91955326150e7bd7a5abb4e9dc40acde7c2f892edeb4e1abb8b10b19f8113"
  license "MIT"
  head "https://github.com/EbodShojaei/bake.git", branch: "main"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  # mbake needs runtime deps (rich, typer), so install them and use prebuilt
  # wheels rather than the default dependency-free, source-only build.
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    # Only expose mbake; its deps also install console scripts (typer,
    # pygmentize, markdown-it, ...) that would collide with other formulae.
    bin.install_symlink libexec/"bin/mbake"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mbake --version")
  end
end
