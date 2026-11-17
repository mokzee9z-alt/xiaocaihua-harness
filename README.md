# 小菜花 Harness（DeepSeek Harness / dsh）— Android Termux 安裝包

在 Android 手機的 Termux 裡跑 [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness)（`dsh`）的實測安裝流程。

## 實測環境（2026-11-17）

| 項目 | 版本 |
|---|---|
| 裝置 | motorola moto g34 5G（LineageOS 24.0 / Android 17 / Magisk root） |
| Termux | tarball bootstrap（packages.termux.dev） |
| Node.js | 24.22.3（`nodejs-lts`） |
| dsh | 0.2.2-rc.1 |
| 安裝時間 | npm 646 個套件，約 4 分鐘 |

## 安裝

在 Termux 裡：

```bash
curl -fsSL https://raw.githubusercontent.com/mokzee9z-alt/xiaocaihua-harness/main/install.sh | bash
```

或先 clone：

```bash
git clone https://github.com/mokzee9z-alt/xiaocaihua-harness
cd xiaocaihua-harness
bash install.sh
```

## 這支腳本做什麼

1. 把 Termux 的 apt 來源指向 `packages.termux.dev`（新 bootstrap 的預設 mirror group 常常沒選，會出現 `No mirror or mirror group selected`）
2. `apt update` + `apt full-upgrade`（舊 bootstrap 的 libc++/openssl 太舊，會讓 `node` 出現 `CANNOT LINK EXECUTABLE`）
3. 裝 `nodejs-lts`、`git`
4. `npm install -g @deepseek-ai/dsh`
5. `dsh --version` 驗證

## 已知事項

- npm 會因為安全策略跳過 5 個 install script（`koffi`、`node-pty`、`@google/genai`、`protobufjs`）。`dsh` CLI 可正常執行；日後若某功能需要原生模組，跑 `npm rebuild -g` 補回。
- 第一次跑 `dsh` 會建立 `~/.dsh`，並需要 LLM 憑證（`DEEPSEEK_API_KEY` 或 `dsh` 支援的 provider）。
- `dsh web` 會印出帶 token 的本機網址；手機上建議用 `dsh headless "..."` 或 `dsh tui`。
