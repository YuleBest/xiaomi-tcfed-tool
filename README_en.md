# Xiaomi temperature controlled file encryption/decryption tool

Bash script toolset for encrypting/decrypting Xiaomi's temperature controlled files

## Prerequisites

- Bash version 4.0 or above (use `bash --version` to see the version number)

- [openssl](https://github.com/openssl/openssl) `pkg install openssl openssl-tool`

- xxd `pkg install xxd`

## Decrypt the temperature control file

1. Modify `INPUT_DIR` in `d.sh` (default `/verdor/etc` for most devices). 2. Execute `d.sh`.

2. Execute `d.sh` and the decrypted file will be saved to `./decrypted`.

## Encrypt the temperature control file

Execute `e.sh` and the encrypted file will be saved to `./encrypted`.

## Help

- Some temperature control files are not encrypted, and will be skipped when decrypting.

- Reading `/verdor` directly requires `Root` permission.

- [MIUI temperature control instructions.md](https://github.com/helloklf/vtools/blob/scene3/docs%2FMIUI%E6%B8%A9%E6%8E%A7%E8%AF%B4%E6%98%8E.md)