#!/bin/bash
# By Yule
# 禁止商业用途

INPUT_DIR="/vendor/etc"    # 输入文件目录
OUTPUT_DIR="$SCTIPT_DIR/decrypted"    # 输出文件目录
KEY_STRING="thermalopenssl.h"

SCTIPT_DIR="$(dirname $(readlink -f $0))"
GR='\033[0;32m'
YE='\033[1;33m'
RE='\033[0;31m'
BRE='\033[41m'
BYE='\033[43m'
BGR='\033[42m'
RES='\033[0m'

# 删除残留
CLEAR_RES() {
    rm -rf $OUTPUT_DIR
}

# 将密钥转换为十六进制格式
BIN_TRANS() {
    HEX_KEY=$(echo -n "$KEY_STRING" | xxd -p | tr -d '\n')
    IV="$HEX_KEY"  # AES-CBC 使用密钥前 16 字节作为 IV
}

# 失败
I_AM_GG() {
    local gg_reason="$1"
    echo -e "${BRE}[FAIL]${RES} 错误: ${gg_reason}"
    exit 1
}

# 检查工具
CHECK_TOOLS() {
    local missing=()
    if ! command -v openssl &> /dev/null; then
        missing+=("openssl")
    fi
    if ! command -v xxd &> /dev/null; then
        missing+=("xxd (vim-common包)")
    fi
    if [[ ${#missing[@]} -gt 0 ]]; then
        I_AM_GG "缺少必要依赖 - ${missing[*]}"
    fi
}

# 文件操作
FXXK_JINFAN() {
    find "$INPUT_DIR" -type f -name 'thermal*.conf' -print0 | while IFS= read -r -d '' file; do
        # 构建输出路径
        relative_path="${file#$INPUT_DIR/}"
        output_file="$OUTPUT_DIR/$relative_path"
        mkdir -p "$(dirname "$output_file")"
        # 解密
        if openssl enc -d -aes-128-cbc \
            -in "$file" \
            -out "$output_file" \
            -K "$HEX_KEY" \
            -iv "$IV" \
            -nosalt 2>/dev/null; then
            echo -e "${GR}[SUCCESS]${RES} $file"
        else
            echo -e "${RE}[ERROR]${RES}   $file (可能已是明文)"
        fi
    done
}

MAIN() {
    CLEAR_RES
    BIN_TRANS
    CHECK_TOOLS
    FXXK_JINFAN
    exit 0
}

MAIN