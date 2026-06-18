class Pf < Formula
  desc ": a header only template library for fast particle filtering!"
  homepage "https://github.com/tbrown122387/pf/"
  # 仅 head:stable v1.0.3 的 CMakeLists 要求 Catch2 2.9.2,而 brew 的 catch2 已是 v3,
  # 版本不兼容无法 configure;master 已升级到 Catch2 3,故用 head。
  license "MIT"
  head "https://github.com/tbrown122387/pf.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "eigen@3"
  depends_on "catch2"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  def caveats
    <<~EOS
      仅 head 版本:stable v1.0.3 要 Catch2 2.9.2,与 brew 的 catch2 v3 冲突,无法构建。
      请用 `brew install --HEAD pf`。
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test pf`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
