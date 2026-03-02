# Rocket.Chat for fnOS

每日自动同步 [Rocket.Chat](https://rocket.chat/) 最新版本并构建 `.fpk` 安装包。

## 下载

从 [Releases](https://github.com/conversun/fnos-apps/releases?q=rocketchat) 下载最新的 `.fpk` 文件。

## 安装

1. 根据设备架构下载对应的 `.fpk` 文件
2. fnOS 应用管理 → 手动安装 → 上传

**访问地址**: `http://<NAS-IP>:3003`

## 说明

- Rocket.Chat 是开源团队协作通讯平台，类似 Slack/Teams 的自托管方案
- 支持即时消息、音视频通话、文件共享、频道管理
- 包含 2 个服务容器: Rocket.Chat、MongoDB (Replica Set)
- MongoDB 使用 Bitnami 镜像，自动配置副本集模式
- 首次启动需要拉取镜像，耗时较长

## 本地构建

```bash
cd apps/rocketchat && bash ../../scripts/build-fpk.sh . app.tgz
```

## 版本标签

- `rocketchat/v7.3.0` — 首次发布
- `rocketchat/v7.3.0-r2` — 同版本打包修订
