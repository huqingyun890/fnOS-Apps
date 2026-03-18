#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
PKG_DIR="$SCRIPT_DIR/fnos"

APP_NAME="nanobot"
APP_DISPLAY_NAME="Nanobot"
APP_VERSION_VAR="NANOBOT_VERSION"
APP_VERSION="${NANOBOT_VERSION:-latest}"
APP_DEPS=(curl)
APP_FPK_PREFIX="nanobot"
APP_HELP_VERSION_EXAMPLE="0.1.4"

app_set_arch_vars() {
    case "$ARCH" in
        x86) DOCKER_PLATFORM="linux/amd64" ;;
        arm) DOCKER_PLATFORM="linux/arm64" ;;
    esac
    info "Docker platform: $DOCKER_PLATFORM"
}

app_show_help_examples() {
    cat << EOF
  $0 --arch x86 0.1.4       # 指定版本，x86 架构
  $0 0.1.4                  # 指定版本，自动检测架构
EOF
}

app_get_latest_version() {
    info "获取最新版本信息..."
    local tag
    tag=$(curl -sL "https://api.github.com/repos/HKUDS/nanobot/releases/latest" 2>/dev/null | \
        grep '"tag_name":' | sed -E 's/.*"v?([^"]+)".*/\1/')
    if [ "$APP_VERSION" = "latest" ]; then
        APP_VERSION="$tag"
    fi
    [ -z "$APP_VERSION" ] && error "无法获取版本信息，请手动指定: $0 0.1.4"
    info "目标版本: $APP_VERSION"
}

app_download() {
    info "Docker 模式，无需下载二进制文件"
    mkdir -p "$WORK_DIR"
}

app_build_app_tgz() {
    info "构建 app.tgz (Docker 模式)..."
    cd "$WORK_DIR"
    local dst="$WORK_DIR/app_root"
    mkdir -p "$dst/docker" "$dst/ui"

    cp "$PKG_DIR/docker/docker-compose.yaml" "$dst/docker/"
    cp -a "$PKG_DIR/ui"/* "$dst/ui/" 2>/dev/null || true

    cd "$dst"
    tar -czf "$WORK_DIR/app.tgz" .
    info "app.tgz: $(du -h "$WORK_DIR/app.tgz" | cut -f1)"
}

source "$REPO_ROOT/scripts/lib/update-common.sh"
main_flow "$@"
