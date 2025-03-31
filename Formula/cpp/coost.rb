# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftxui.rb                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chenxu <chenxu@mail.ustc.edu.cn>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/08 01:41:10 by chenxu            #+#    #+#              #
#    Updated: 2025/01/08 01:43:39 by chenxu           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# cspell:disable
class Coost < Formula
  desc "A tiny boost library in C++11."
  homepage "https://github.com/idealvin/coost"
  url "https://github.com/idealvin/coost/archive/refs/tags/v3.0.2.tar.gz"
  head "https://github.com/idealvin/coost.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "openssl@3"

  def install
    args = std_cmake_args + %w[
      -DFPIC=ON
      -DBUILD_SHARED_LIBS=ON
      -DWITH_LIBCURL=ON
      -DWITH_OPENSSL=ON
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
