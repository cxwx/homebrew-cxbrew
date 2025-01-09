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
class CppSort < Formula
  desc ""
  homepage ""
  url ""
  head "", branch: "main"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args + %w[
      -DCMAKE_CXX_STANDARD=20
    ]

    system "cmake", "-S" ,".", "-B", "builddir", *args
    system "cmake", "--build", "builddir"
    system "cmake", "--install", "builddir"
  end

end
