class Wordcloud < Formula
  include Language::Python::Virtualenv

  desc "Generate word clouds from text"
  homepage "https://github.com/amueller/word_cloud"
  url "https://files.pythonhosted.org/packages/6f/04/a3d3c4b94a35586ddb97c6a3c508913159161cd558b34f315b382b924bf7/wordcloud-1.9.6.tar.gz"
  sha256 "df17c468ff903bd0aba4f87c6540745d13a4931220dd4937cb363ad85a4771b9"
  license "MIT"
  head "https://github.com/amueller/word_cloud.git", branch: "main"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  # wordcloud and its dependencies (numpy, pillow, matplotlib) all ship
  # prebuilt cp314 wheels, so install them instead of the default
  # dependency-free, source-only build (building numpy/matplotlib from source
  # is slow and fragile).
  def std_pip_args(prefix: false, build_isolation: true)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--no-build-isolation" unless build_isolation
    args
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install buildpath
    # Only expose wordcloud_cli; its dependencies also install console scripts
    # (f2py, fonttools, ttx, ...) that would collide with other formulae.
    bin.install_symlink libexec/"bin/wordcloud_cli"

    (prefix/Language::Python.site_packages(python3)/"homebrew-wordcloud.pth").write venv.site_packages
  end

  test do
    system python3, "-c", "from wordcloud import WordCloud; print(WordCloud)"
    assert_match "usage", shell_output("#{bin}/wordcloud_cli --help")
  end
end
