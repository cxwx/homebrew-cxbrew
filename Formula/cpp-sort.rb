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
class CppSort < Formula
  desc "Sorting algorithms & related tools for C++14"
  homepage "https://github.com/Morwenn/cpp-sort"
  url "https://github.com/Morwenn/cpp-sort/archive/refs/tags/1.16.0.tar.gz"
  head "https://github.com/Morwenn/cpp-sort.git", branch: "main"  # BUG: no main nor master branch

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DCMAKE_CXX_STANDARD=20
      -DBUILD_TESTING=OFF
      -DCPPSORT_BUILD_TESTING=OFF
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
