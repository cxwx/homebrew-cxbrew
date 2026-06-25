class Debugpy < Formula
  include Language::Python::Virtualenv

  desc "Implementation of the Debug Adapter Protocol for Python"
  homepage "https://github.com/microsoft/debugpy"
  url "https://files.pythonhosted.org/packages/f2/aa/12037145b7a56eaa5b29b41872f7a21b538e807e13f32c4d3c46e59be084/debugpy-1.8.21.tar.gz"
  sha256 "a3c53278e84c94e11bd87c53970ec391d1a67396c8b22609fcac576520e611a6"
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
