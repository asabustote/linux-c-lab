#!/usr/bin/env bash

# -----------------------------------------
# Phase1 Week Markdown Generator
# -----------------------------------------

BASE_DIR="$(dirname "$(dirname "$(dirname "$0")")")"
OUTPUT_DIR="$BASE_DIR/docs/phase1"

mkdir -p "$OUTPUT_DIR"

# Week titles
WEEKS=(
    "Week01: Design Week"
    "Week02: SSH サーバ構築"
    "Week03: Web サーバ構築 (Nginx)"
    "Week04: DNS/DHCP/NTP サーバ構築"
    "Week05: Mail サーバ構築 (Postfix)"
    "Week06: Blog Week / 振り返り"
)

# 平日の調査内容
WEEKDAY=(
    "- サーバ全体構成  
- systemdとは何か  
- ポート/サービス設計  
- ネットワーク基礎（IP, DNS, ルーティング）  
- 必要パッケージの比較"
    "- SSHの仕組み  
- 鍵認証方式の理解  
- sshd_configの読み方  
- ログの種類と確認方法"
    "- Nginxの内部構造  
- 仮想ホストとは  
- ドキュメントルートの構成  
- ログ/アクセス管理の基礎"
    "- DNSの仕組み（権威/キャッシュ）  
- BIND9の内部  
- DHCPの挙動  
- NTPの時刻同期"
    "- Postfix の役割  
- メール配送/SMTPの流れ  
- メールログ解析  
- ユーザ管理"
    "- Phase全体の振り返り  
- ブログ方針整理  
- 設計図/図解まとめ  
- 記事構成を作る"
)

# 土日の作業内容
WEEKEND=(
    "- サーバ構成図作成  
- ポート/サービス一覧作成  
- 必要パッケージの調査  
- 設計ドキュメント作成"
    "- SSHサーバ構築  
- 鍵認証設定  
- 接続テスト  
- systemd常駐化"
    "- Nginx Webサーバ構築  
- サイト公開  
- 仮想ホスト設定  
- アクセスログ確認"
    "- DNS(DIND9)/DHCP/NTP サーバ構築  
- 各サービスの連携テスト  
- クライアントからの動作確認"
    "- Postfix メールサーバ構築  
- テストメール送受信  
- メールログ確認  
- 他サービスとの連携確認"
    "- 振り返り資料作成  
- まとめ記事の執筆  
- 図解・コマンドまとめ  
- トラブルシュート整理"
)

# Loop to generate weekXX.md
for i in {0..5}; do
    WEEK_NUM=$(printf "%02d" $((i + 1)))
    FILE="$OUTPUT_DIR/week${WEEK_NUM}.md"

    cat <<EOF >"$FILE"
# 📅 Phase1 - Week ${WEEK_NUM}

## 🎯 目的
${WEEKS[$i]}

---

## 📘 平日の調査内容
${WEEKDAY[$i]}

---

## 🧪 土日の作業内容
${WEEKEND[$i]}

---

## 📚 参考資料
- SSH: man sshd_config, OpenSSH 公式  
- Web: Nginx Beginner’s Guide  
- DNS/DHCP/NTP: BIND9, ISC DHCP, NTP.org  
- Mail: Postfix Basic Configuration  
- Linux基礎: systemctl, journalctl  
- Firewall: iptables, ufw  

---

## ✍ 学習メモ
- 実装で工夫した点  
- 詰まった点  
- 追加で学んだこと  

---

## ⏱️ 実績時間
- 平日：  
- 土日：  

---

## 📌 次週予定
- 次週のテーマに備えた下調べ
EOF

    echo "Generated $FILE"
done
