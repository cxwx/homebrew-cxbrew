class Gita < Formula
  include Language::Python::Virtualenv

  desc "Manage multiple git repositories from the command-line"
  homepage "https://github.com/nosarthur/gita"
  url "https://files.pythonhosted.org/packages/1d/89/8dd6dd79eadd70ff2f64b79f434637e384cd0490c2a626074e2a73c8a896/gita-0.16.8.2.tar.gz"
  sha256 "064e5cbcfa5df76409cfd8e70142f8153f6ecc40fb35d3a28a0a04054d5fb3fd"
  license "MIT"
  head "https://github.com/nosarthur/gita.git", branch: "master"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  # The default std_pip_args installs with --no-deps, so override it to also
  # pull gita's runtime dependencies (argcomplete, packaging).
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/gita"
  end

  test do
    assert_match "usage", shell_output("#{bin}/gita --help")
  end
end
