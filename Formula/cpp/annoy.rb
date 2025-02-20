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

class Annoy < Formula
  desc "Approximate Nearest Neighbors in C++/Python optimized for memory usage and loading/saving to disk"
  homepage "https://github.com/spotify/annoy"
  head "https://github.com/spotify/annoy.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "make" => :build

  def install
    args = std_cmake_args

    system "cmake", "-S", ".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end
end
