# TODO: add 3rd conflicts, now not install
class Yalantinglibs < Formula
  desc "collection of modern C++ libraries, include coro_http, coro_rpc, compile-time reflection, struct_pack, struct_json, struct_xml, struct_pb, easylog, async_simple etc"
  homepage "https://github.com/alibaba/yalantinglibs"
  url "https://github.com/alibaba/yalantinglibs/archive/refs/tags/lts1.0.2.tar.gz"
  sha256 "91049e5c2931918fe57d7513c0cd2797e07c5e642aa40da40a511b0999ae2ec7"
  license "Apache-2.0"
  head "https://github.com/alibaba/yalantinglibs.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = %w[
      -DINSTALL_INDEPENDENT_STANDALONE=OFF
      -DINSTALL_INDEPENDENT_THIRDPARTY=OFF
      -DINSTALL_STANDALONE=OFF
      -DINSTALL_THIRDPARTY=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args, *std_cmake_args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
  test do
    system "echo", "not finished"
  end
end
