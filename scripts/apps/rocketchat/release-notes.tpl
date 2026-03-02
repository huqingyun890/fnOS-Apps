自动构建的 fnOS 安装包

- 基于 [Rocket.Chat ${VERSION}](https://github.com/RocketChat/Rocket.Chat/releases/tag/${VERSION})
- 平台: fnOS
- 默认端口: ${DEFAULT_PORT}${REVISION_NOTE}
- 包含服务: Rocket.Chat, MongoDB (Replica Set)
- 支持即时消息、音视频通话、文件共享

**首次使用**:
1. 访问 `http://your-nas-ip:${DEFAULT_PORT}` 完成初始设置向导
2. 创建管理员账户并配置工作区
3. 建议配置反向代理以启用 HTTPS

${CHANGELOG}
**国内镜像**:
- [${FILE_PREFIX}_${FPK_VERSION}_x86.fpk](https://ghfast.top/https://github.com/conversun/fnos-apps/releases/download/${RELEASE_TAG}/${FILE_PREFIX}_${FPK_VERSION}_x86.fpk)
- [${FILE_PREFIX}_${FPK_VERSION}_arm.fpk](https://ghfast.top/https://github.com/conversun/fnos-apps/releases/download/${RELEASE_TAG}/${FILE_PREFIX}_${FPK_VERSION}_arm.fpk)
