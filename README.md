# MongoDB (Local Dev via Docker)

## 使用前
1. 複製 `.env.example` 為 `.env` 並視需求調整
2. 需要 Docker 及 Docker Compose

## 常用指令
- 啟動: `make up`
- 查看狀態: `make ps`
- 追蹤日誌: `make logs`
- 連線 shell: `make shell`
- 停止: `make down`
- 停止並移除資料卷: `make down-v`

## 備份/還原
- 備份: `make backup` → 產出於 `dump/<timestamp>/dump`
- 還原: `make restore dump/<timestamp>/dump`

> 備份與還原使用 root 帳號，需與 `.env` 中的帳密一致，並以 `admin` 作為 authenticationDatabase。
