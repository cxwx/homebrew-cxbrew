# *************************************************************************** #
#                                                                             #
#                                                        :::      ::::::::    #
#    annoy.rb                                          :+:      :+:    :+:    #
#                                                    +:+ +:+         +:+      #
#    By: chenxu <chenxu@mail.ustc.edu.cn>          +#+  +:+       +#+         #
#                                                +#+#+#+#+#+   +#+            #
#    Created: 2025/02/20 13:35:27 by chenxu           #+#    #+#              #
#    Updated: 2025/02/20 13:37:06 by chenxu          ###   ########.fr        #
#                                                                             #
# *************************************************************************** #

class DbgMacro < Formula
  desc "Dbg(…) macro for C++"
  homepage "https://github.com/sharkdp/dbg-macro"
  url "https://github.com/sharkdp/dbg-macro/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "fffea75f067c69995853dc790626887788e2c4c9eb0a5a0014a4501d2b6b9909"
  license "MIT"
  head "https://github.com/sharkdp/dbg-macro.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "make" => :build

  def install
    args = std_cmake_args + %w[
      -DCATCH_BUILD_TESTING=OFF
      -DDBG_MACRO_ENABLE_TESTS=OFF
    ]

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

  test do
    (testpath/"test.cpp").write <<~CPP
      #include <dbg.h>
      int main() {
        dbg(42, "hello world", false);
      }
    CPP
    system ENV.cxx, "test.cpp", "-std=c++17", "-o", "test"
    system "./test"
  end
end
