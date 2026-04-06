#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
PKG_DIR="$SCRIPT_DIR/fnos"

APP_NAME="clamav"
APP_DISPLAY_NAME="ClamAV"
APP_VERSION_VAR="CLAMAV_VERSION"
APP_VERSION="${CLAMAV_VERSION:-latest}"
APP_DEPS=(curl tar jq)
APP_FPK_PREFIX="clamav"
APP_HELP_VERSION_EXAMPLE="1.4"

app_set_arch_vars() {
    case "$ARCH" in
        x86)
            info "ClamAV Docker image is amd64-only; building x86 package"
            ;;
        arm)
            error "ClamAV Docker image has no ARM64 support; x86 packages only"
            ;;
    esac
}

app_show_help_examples() {
    cat << EOF
  $0 1.4                   # 指定版本
EOF
}

app_get_latest_version() {
    info "获取最新版本信息..."

    local tag
    tag=$(curl -sL "https://api.github.com/repos/Cisco-Talos/clamav/releases/latest" | jq -r '.tag_name')

    if [ "$APP_VERSION" = "latest" ]; then
        APP_VERSION=$(echo "$tag" | sed -E 's/^clamav-//' | sed -E 's/^v//')
    fi

    [ -z "$APP_VERSION" ] && error "无法获取版本信息，请手动指定: $0 1.4"
    info "目标版本: $APP_VERSION"
}

app_download() {
    :
}

app_build_app_tgz() {
    info "构建 app.tgz (Docker)..."
    export VERSION="$APP_VERSION"
    bash "$REPO_ROOT/scripts/apps/clamav/build.sh"
    cp "$REPO_ROOT/app.tgz" "$WORK_DIR/app.tgz"
    info "app.tgz: $(du -h "$WORK_DIR/app.tgz" | cut -f1)"
}

source "$REPO_ROOT/scripts/lib/update-common.sh"
main_flow "$@"
