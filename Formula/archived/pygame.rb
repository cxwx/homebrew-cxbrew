class Pygame < Formula
  desc "Cross-platform library for game development"
  homepage "https://www.pygame.org"

  url "https://files.pythonhosted.org/packages/49/cc/08bba60f00541f62aaa252ce0cfbd60aebd04616c0b9574f755b583e45ae/pygame-2.6.1.tar.gz"
  sha256 "56fb02ead529cee00d415c3e007f75e0780c655909aaa8e8bf616ee09c9feb1f"
  license "LGPL-2.1-only"

  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "python@3.14"
  depends_on "sdl2"
  depends_on "sdl2_image"
  depends_on "sdl2_mixer"
  depends_on "sdl2_ttf"

  def python3
    which("python3.14")
  end

  def install
    target = libexec/"lib/python3.14/site-packages"
    system "python3.14", "-m", "pip", "install", "--no-build-isolation", "--no-deps", "--target", target, "."
    (prefix/Language::Python.site_packages(python3)/"homebrew-pygame.pth").write target
  end

  test do
    system python3, "-c", "import pygame; print(pygame.ver)"
  end
end
