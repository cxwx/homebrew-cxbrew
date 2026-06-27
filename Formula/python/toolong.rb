class Toolong < Formula
  include Language::Python::Virtualenv

  desc "View and search log files in the terminal"
  homepage "https://github.com/Textualize/toolong"
  url "https://files.pythonhosted.org/packages/45/02/2a412839be723f58bd45c23c3fc89ea18c3bb76d5a3688c23c8e4f8c0734/toolong-1.5.0.tar.gz"
  sha256 "49934701f954f9701d37381bed6e0f3dfbea0abe1065fcf1ff35de9eef3bbcf3"
  license "MIT"
  head "https://github.com/Textualize/toolong.git", branch: "main"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  # The default std_pip_args installs with --no-deps, so override it to also
  # pull toolong's runtime dependencies (click, textual, typing-extensions).
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    # Only expose `tl`; the textual dependency also installs a `textual` script.
    bin.install_symlink libexec/"bin/tl"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/tl --help")
  end
end
