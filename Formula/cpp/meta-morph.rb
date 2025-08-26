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
class MetaMorph < Formula
  desc "A small C++ Decorator Library"
  homepage "https://github.com/DeForestt/meta-morph"
  head "https://github.com/DeForestt/meta-morph.git", branch: "main"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
