# MelodyHub for fnOS

Web 音乐搜索与下载服务，基于 [lx-music-desktop](https://github.com/lyswhut/lx-music-desktop) 核心逻辑开发。

- **上游仓库**: https://github.com/gefl24/melody-hub
- **Docker 镜像**: geelonn/melodyhub
- **默认端口**: 3006
- **架构**: 仅 x86 (上游暂未提供 ARM 镜像)

## 功能

- 多音源支持 (网易云、QQ音乐、酷我、酷狗等)
- 服务器端下载 (断点续传、队列管理)
- WebSocket 实时推送下载进度
- SQLite 数据持久化
- 内置歌曲管理器 (元数据编辑)

## Local Build

```bash
cd apps/melody-hub && ./update_melody-hub.sh
```
