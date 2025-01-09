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
class PlfIndiesort < Formula
  desc "A sort wrapper enabling both use of random-access sorting on non-random access containers, and increased performance for the sorting of large types."
  homepage "https://github.com/mattreecebentley/plf_indiesort"
  # url "https://github.com/mattreecebentley/plf_indiesort"
  head "https://github.com/mattreecebentley/plf_indiesort.git", branch: "master"

  def install
    include.install "plf_indiesort.h"
  end

end
