# 小米温控文件加解密工具

用于加密/解密小米的温控文件的 Bash 脚本工具集

## 先决条件

- Bash 版本 4.0 或以上 (使用 `bash --version` 查看版本号)

- [openssl](https://github.com/openssl/openssl) `pkg install openssl openssl-tool`

- xxd `pkg install xxd`

## 解密温控文件

1. 修改 `d.sh` 的 `INPUT_DIR` (默认 `/verdor/etc`，适用于大部分设备)。

2. 执行 `d.sh`，解密后的文件会保存到 `./decrypted`。

## 加密温控文件

执行 `e.sh`，加密后的文件会保存到 `./encrypted`。

## 帮助

- 部分温控文件未被加密，解密时会跳过这一部分文件。

- 直接读取 `/verdor` 需要 `Root` 权限。

- [MIUI 温控说明.md](https://github.com/helloklf/vtools/blob/scene3/docs%2FMIUI%E6%B8%A9%E6%8E%A7%E8%AF%B4%E6%98%8E.md)