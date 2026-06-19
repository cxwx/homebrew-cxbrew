#!/bin/bash
# Neomacs Linux 安装辅助脚本

set -e

VERSION="${NEOMACS_VERSION:-0.0.7}"
REPO="eval-exec/neomacs"

detect_distro() {
  if [[ -f /etc/os-release ]]
  then
    . /etc/os-release
    echo "${ID}"
  else
    echo "unknown"
  fi
}

install_deb() {
  echo "正在下载 Neomacs .deb 包..."
  curl -L "https://github.com/${REPO}/releases/download/v${VERSION}/neomacs_${VERSION}_amd64.deb" -o "/tmp/neomacs_${VERSION}_amd64.deb"

  echo "正在安装..."
  if command -v sudo &>/dev/null
  then
    sudo dpkg -i "/tmp/neomacs_${VERSION}_amd64.deb"
    sudo apt-get install -f -y # 修复依赖
  else
    su -c "dpkg -i '/tmp/neomacs_${VERSION}_amd64.deb' && apt-get install -f -y"
  fi

  rm -f "/tmp/neomacs_${VERSION}_amd64.deb"
  echo "安装完成！"
}

install_rpm() {
  echo "正在下载 Neomacs .rpm 包..."
  curl -L "https://github.com/${REPO}/releases/download/v${VERSION}/neomacs-${VERSION}-1.x86_64.rpm" -o "/tmp/neomacs-${VERSION}-1.x86_64.rpm"

  echo "正在安装..."
  if command -v sudo &>/dev/null
  then
    sudo dnf install "/tmp/neomacs-${VERSION}-1.x86_64.rpm" -y ||
      sudo yum install "/tmp/neomacs-${VERSION}-1.x86_64.rpm" -y ||
      sudo zypper install "/tmp/neomacs-${VERSION}-1.x86_64.rpm" -y
  else
    echo "请手动安装: sudo dnf/yum/zypper install /tmp/neomacs-${VERSION}-1.x86_64.rpm"
    exit 1
  fi

  rm -f "/tmp/neomacs-${VERSION}-1.x86_64.rpm"
  echo "安装完成！"
}

install_appimage() {
  echo "正在下载 Neomacs AppImage..."
  curl -L "https://github.com/${REPO}/releases/download/v${VERSION}/neomacs-${VERSION}-x86_64-unknown-linux-gnu.AppImage" -o "/tmp/neomacs.AppImage"

  chmod +x "/tmp/neomacs.AppImage"

  INSTALL_DIR="${HOME}/.local/bin"
  mkdir -p "${INSTALL_DIR}"
  mv "/tmp/neomacs.AppImage" "${INSTALL_DIR}/neomacs"

  echo "AppImage 已安装到 ${INSTALL_DIR}/neomacs"
  echo "运行: ${INSTALL_DIR}/neomacs"
}

install_tarball() {
  echo "正在下载 Neomacs tar.gz 包..."

  ARCH=$(uname -m)
  if [[ "${ARCH}" = "aarch64" ]] || [[ "${ARCH}" = "arm64" ]]
  then
    FILE="neomacs-${VERSION}-aarch64-unknown-linux-gnu.tar.gz"
  else
    FILE="neomacs-${VERSION}-x86_64-unknown-linux-gnu.tar.gz"
  fi

  curl -L "https://github.com/${REPO}/releases/download/v${VERSION}/${FILE}" -o "/tmp/${FILE}"

  echo "正在解压..."
  tar -xzf "/tmp/${FILE}" -C /tmp/

  INSTALL_DIR="${HOME}/.local"
  mkdir -p "${INSTALL_DIR}/bin"
  cp /tmp/neomacs "${INSTALL_DIR}/bin/"

  rm -f "/tmp/${FILE}"
  rm -rf "/tmp/neomacs"

  echo "安装完成！二进制文件位于 ${INSTALL_DIR}/bin/neomacs"
  echo "请确保 ${INSTALL_DIR}/bin 在你的 PATH 中"
}

main() {
  DISTRO=$(detect_distro)

  echo "检测到的发行版: ${DISTRO}"
  echo "Neomacs 版本: ${VERSION}"
  echo ""

  case "$1" in
    deb | debian | ubuntu)
      install_deb
      ;;
    rpm | fedora | rhel | centos | suse)
      install_rpm
      ;;
    appimage)
      install_appimage
      ;;
    tar | tarball | homebrew)
      install_tarball
      ;;
    *)
      echo "用法: $0 [deb|rpm|appimage|tar]"
      echo ""
      echo "示例:"
      echo "  $0 deb      # 安装 .deb 包 (Ubuntu/Debian)"
      echo "  $0 rpm      # 安装 .rpm 包 (Fedora/RHEL)"
      echo "  $0 appimage # 安装 AppImage (通用)"
      echo "  $0 tar      # 安装 tar.gz (通用)"
      echo ""
      echo "或者指定版本: NEOMACS_VERSION=0.0.6 $0 deb"
      exit 1
      ;;
  esac
}

main "$@"
