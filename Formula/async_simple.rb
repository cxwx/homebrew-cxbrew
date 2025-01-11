# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    createmodel_c_x.rb                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chenxu <chenxu@mail.ustc.edu.cn>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/09 19:29:29 by chenxu            #+#    #+#              #
#    Updated: 2025/01/09 19:29:30 by chenxu           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# cspell:disable
class AsyncSimple < Formula
  desc "https://github.com/alibaba/async_simple"
  homepage "https://github.com/alibaba/async_simple"
  url "https://github.com/alibaba/async_simple/archive/refs/tags/v1.3.tar.gz"
  head "https://github.com/alibaba/async_simple.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DCMAKE_CXX_STANDARD=20
      -DBUILD_GMOCK=OFF
      -DBUILD_GTEST=OFF
      -DINSTALL_GTEST=OFF
      -DASYNC_SIMPLE_BUILD_DEMO_EXAMPL=OFF
      -DASYNC_SIMPLE_ENABLE_TESTS=OFF
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
