class KanbanPython < Formula
  include Language::Python::Virtualenv

  desc "Terminal kanban board"
  homepage "https://github.com/Zaloog/kanban-python"
  url "https://files.pythonhosted.org/packages/cf/85/67c8d1ccd2ef836c3968425754dee85a238a1acfccb30787a20953002024/kanban_python-0.6.4.tar.gz"
  sha256 "cf818fceabd60185a777896b7d852ab04454ef852d26ae726aa620ed2035f99d"
  license "MIT"
  head "https://github.com/Zaloog/kanban-python.git", branch: "main"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  # The default std_pip_args installs with --no-deps, so override it to also
  # pull kanban-python's runtime dependencies (platformdirs, rich).
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/kanban"
  end

  test do
    assert_match "usage", shell_output("#{bin}/kanban --help")
  end
end
