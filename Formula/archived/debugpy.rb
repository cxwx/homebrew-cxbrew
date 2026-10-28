class Debugpy < Formula
  include Language::Python::Virtualenv

  desc "Implementation of the Debug Adapter Protocol for Python"
  homepage "https://github.com/microsoft/debugpy"
  url "https://files.pythonhosted.org/packages/44/9d/3cb6693342acf96802dba89934a5b8da43c201d764ebd1f2c0514a3d42bd/debugpy-1.8.22.tar.gz"
  sha256 "e489c7268e1c7b41e13b438d9c533d2a7af73fb59bf8cd30fead8286c1c39c4e"
  license "MIT"
  head "https://github.com/microsoft/debugpy.git", branch: "main"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  # Use the prebuilt wheel: the sdist omits the native attach-to-process library
  # (attach.dylib) that the wheel ships, so the default `--no-binary=:all:` would
  # produce an incomplete install.
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--no-deps", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    virtualenv_create(libexec, python3).pip_install_and_link "debugpy==#{version}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/debugpy --help 2>&1")
  end
end
