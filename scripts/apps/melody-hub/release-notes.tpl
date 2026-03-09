自动构建的 fnOS 安装包

- 基于 [MelodyHub v${VERSION}](https://github.com/gefl24/melody-hub)
- 基于 Docker 容器运行，需要 fnOS Docker 环境
- 平台: fnOS
- 默认端口: ${DEFAULT_PORT}
- Docker 镜像: geelonn/melodyhub:v${VERSION}${REVISION_NOTE}

**首次使用**:
1. 访问 `http://your-nas-ip:${DEFAULT_PORT}` 打开 Web 界面
2. 进入"系统设置 → 音源管理"上传自定义源文件
3. 搜索音乐并管理下载任务

> 注意: 当前仅支持 x86 架构，上游暂未提供 ARM 镜像。

${CHANGELOG}
**国内镜像**:
- [${FILE_PREFIX}_${FPK_VERSION}_x86.fpk](https://ghfast.top/https://github.com/conversun/fnos-apps/releases/download/${RELEASE_TAG}/${FILE_PREFIX}_${FPK_VERSION}_x86.fpk)
