class Md2typst < Formula
  include Language::Python::Virtualenv

  desc "Markdown to Typst converter with multiple parser support"
  homepage "https://git.sr.ht/~sfermigier/md2typst"
  url "https://files.pythonhosted.org/packages/9a/a8/b36135ba4b6af1669b8b43a2d431e2dfc3512050ae15eb206ed0d098dae0/md2typst-0.3.6.tar.gz"
  sha256 "2ca9aa5c671db6e9051589a18a3de2c6c3bb265786083c45461076b52072cbce"
  license "MIT"

  depends_on "python@3.14"

  def python3
    which("python3.14")
  end

  def std_pip_args(prefix: self.prefix, build_isolation: false)
    args = ["--verbose", "--ignore-installed", "--no-compile"]
    args << "--uploaded-prior-to=#{(Time.now.utc - (24 * 60 * 60)).iso8601(0)}"
    args << "--prefix=#{prefix}" if prefix
    args << "--no-build-isolation" unless build_isolation
    args
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/76/d4/81420972a676e8ffea40450d8c8c92943e7218a78fe9b64359836cc9876b/click-8.4.2.tar.gz"
    sha256 "9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "marko" do
    url "https://files.pythonhosted.org/packages/58/cc/01b80dc58e4d44fe039403ef1ac0008bcb9375364ccd246a4b8bfec29b46/marko-2.2.3.tar.gz"
    sha256 "e31ec2875383bc62f9093d16babed5a2c2cde601c00d834ea935a2222120ec19"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56/mdit_py_plugins-0.6.1.tar.gz"
    sha256 "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "mistune" do
    url "https://files.pythonhosted.org/packages/7b/a5/2dab368d6950e6808904dec98f54c7e726ee7be4a0c6afe00e6e011bd52d/mistune-3.3.3.tar.gz"
    sha256 "c4c6c0c840b8637a2e9b8b6d607eb7c8f00888bf14c754409bcd339e848c2477"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/d7/47/e4501f49c178ae1d9f4a75073fda4204f52647993f075a9db4d14930e0c5/platformdirs-4.10.0.tar.gz"
    sha256 "31e761a6a0ca04faf7353ea759bdba55652be214725111e5aac52dfa29d4bef7"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    venv = virtualenv_create(libexec, python3)
    venv.pip_install_and_link buildpath

    (prefix/Language::Python.site_packages(python3)/"homebrew-md2typst.pth").write venv.site_packages
  end

  test do
    system python3, "-c", "import md2typst; from importlib.metadata import version; print(version('md2typst'))"
    system bin/"md2typst", "--help"
  end
end
