#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
PKG_DIR="$SCRIPT_DIR/fnos"

APP_NAME="melody-hub"
APP_DISPLAY_NAME="MelodyHub"
APP_VERSION_VAR="MELODYHUB_VERSION"
APP_VERSION="${MELODYHUB_VERSION:-latest}"
APP_DEPS=(curl jq)
APP_FPK_PREFIX="melody-hub"
APP_HELP_VERSION_EXAMPLE="1.0.1"

app_set_arch_vars() {
    :
}

app_show_help_examples() {
    cat << EOF
  $0 1.0.1                  # Specific version
EOF
}

app_get_latest_version() {
    info "Getting latest version from Docker Hub..."
    if [ "$APP_VERSION" = "latest" ]; then
        APP_VERSION=$(curl -sL "https://hub.docker.com/v2/repositories/geelonn/melodyhub/tags?page_size=100&ordering=last_updated" | \
            jq -r '.results[].name' | \
            grep '^v[0-9]' | \
            sed 's/^v//' | \
            sort -V | \
            tail -1)
    fi
    [ -z "$APP_VERSION" ] && error "Unable to resolve version. Specify manually: $0 1.0.1"
    info "Target version: $APP_VERSION"
}

app_download() {
    :
}

app_build_app_tgz() {
    info "Building app.tgz (Docker)..."
    export VERSION="$APP_VERSION"
    bash "$REPO_ROOT/scripts/apps/melody-hub/build.sh"
    cp "$REPO_ROOT/app.tgz" "$WORK_DIR/app.tgz"
    info "app.tgz: $(du -h "$WORK_DIR/app.tgz" | cut -f1)"
}

source "$REPO_ROOT/scripts/lib/update-common.sh"
main_flow "$@"
