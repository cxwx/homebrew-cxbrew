class Pal < Formula
  desc "Starlink Positional Astronomy Library"
  homepage "https://github.com/IceCube-SPNO/pal"
  # stable v0.9.10 当前装不了:release tarball 不含 CMakeLists.txt(上游尚未为 cmake build 打新 tag,
  # 见 Starlink/pal#25)。保留 url 供 livecheck/CI workflow 跟踪新 release,日常装请用 head。
  url "https://github.com/Starlink/pal/archive/refs/tags/v0.9.10.tar.gz"
  sha256 "dc7461cb03ac3a7ca2ab30c24deee7eb04b656f77d9c41d83f1a64ad3b4f733a"
  head "https://github.com/Starlink/pal.git", using: :git, branch: "master"

  depends_on "cmake" => :build
  depends_on "erfa"
  # if RUBY_PLATFORM.match?(/darwin/)
  # end

  # def install
  #   #    system "autoreconf", "--install", "--symlink", buildpath
  #   # system "autoreconf" "--fiv"
  #   system "./configure", "--disable-debug",
  #                         "--without-starlink",
  #                         "--prefix=#{prefix}"
  #   system "make", "install"
  # end
  def install
    args = %w[]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  def caveats
    <<~EOS
      stable v0.9.10 的 release tarball 缺 CMakeLists.txt,当前无法构建。
      请用 `brew install --HEAD pal`。
    EOS
  end

  test do
    system "true"
  end
end
