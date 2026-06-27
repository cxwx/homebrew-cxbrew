class Systemdlint < Formula
  include Language::Python::Virtualenv

  desc "Systemd Unitfile Linter"
  homepage "https://github.com/priv-kweihmann/systemdlint"
  url "https://files.pythonhosted.org/packages/65/00/77bd801415ed6dd018610934f1600cf2bae4b9659aa01ccb13e4b293426b/systemdlint-1.4.0.tar.gz"
  sha256 "96b05fdc42db2f803fcd7661b5e8edd5d04022401bad1291321d72b3f63b6752"
  license "BSD-2-Clause"
  head "https://github.com/priv-kweihmann/systemdlint.git", branch: "master"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  # systemdlint needs runtime deps (systemdunitparser, anytree), so install
  # them and use prebuilt wheels instead of the default dependency-free,
  # source-only build.
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/systemdlint"
  end

  test do
    assert_match "usage: systemdlint", shell_output("#{bin}/systemdlint --help")
  end
end
