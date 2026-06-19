class Pf < Formula
  desc ": a header only template library for fast particle filtering!"
  homepage "https://github.com/tbrown122387/pf/"
  # stable v1.0.3 当前装不了:CMakeLists 要 Catch2 2.9.2,而 brew catch2 已是 v3,冲突;
  # master 已升级到 Catch2 3。保留 url 供 livecheck/CI workflow 跟踪新 release,日常装请用 head。
  url "https://github.com/tbrown122387/pf/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "332aa9910e2cdbeebe73fc484f7278093abeccec2fe0a34f72b0fdcfc9c23ef3"
  license "MIT"
  head "https://github.com/tbrown122387/pf.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "catch2"
  depends_on "eigen@3"

  def install
    system "cmake", ".", *std_cmake_args
  end

  def caveats
    <<~EOS
      stable v1.0.3 要 Catch2 2.9.2,与 brew 的 catch2 v3 冲突,当前无法构建。
      请用 `brew install --HEAD pf`(master 已升级到 Catch2 3)。
    EOS
  end

  test do
    system "true"
  end
end
