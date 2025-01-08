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
class Ftxui < Formula
  desc "C++ Functional Terminal User Interface."
  homepage "https://github.com/ArthurSonzogni/FTXUI"
  url "https://github.com/ArthurSonzogni/FTXUI/archive/refs/tags/v5.0.0.tar.gz"
  head "https://github.com/ArthurSonzogni/FTXUI", branch: "main"

  depends_on "cmake" => :build

  def install
    mkdir "geant-build" do
      args = std_cmake_args + %w[
        ../
        -DBUILD_SHARED_LIBS=ON
        -DFTXUI_BUILD_DOCS=ON
        -DFTXUI_BUILD_EXAMPLES=ON
        -DFTXUI_BUILD_TESTS=ON
        -DFTXUI_QUIET=ON
        -DFTXUI_ENABLE_COVERAGE=ON
      ]

      system "cmake", *args
      system "make", "install"
    end
  end

end
