# 🚀 Phase 1：Linuxサーバ構築（6週）

> 「まずは土台を作ろう！」  
> SSH/Web/DNS/DHCP/NTP/Mailサーバを通して、Linuxの基本とサービス管理を理解する。

### 🎯 目的
- Linuxサービスの構造を理解  
- systemdによるサービス管理を体験  
- firewall・ネットワーク基礎を学ぶ  

### 📅 週次計画

| Week | 平日下調べ | 土日作業 |
|------|------------|-----------|
| 1 | **Design Week**：サーバ構成、アクセス権、ポート計画、systemd理解、ネットワーク基礎 | 設計・構成図作成、必要パッケージ確認 |
| 2 | SSH設定例、鍵認証、ログ確認 | SSHサーバ構築、接続テスト、systemd常駐化 |
| 3 | Nginx設定例、ドキュメントルート管理 | Webサーバ構築、アクセス確認、仮想ホスト設定 |
| 4 | BIND/DHCP/NTP設定例 | DNS/DHCP/NTPサーバ構築、連携テスト |
| 5 | Postfix設定、ユーザ管理、ログ確認 | Mailサーバ構築、テストメール送受信、サービス連携確認 |
| 6 | フェーズ振り返り、学習ポイント整理 | **Blog Week**：まとめ記事作成、図解・コマンド例・トラブルシュートメモ |

### 📚 参考資料
- SSH: `man sshd_config`, OpenSSH公式
- Web: Nginx Beginner’s Guide
- DNS/DHCP/NTP: BIND9, ISC DHCP, NTP.org 設定ガイド
- Mail: Postfix Basic Configuration, SMTPログ解析
- Linux基礎・systemd: Linux Command Line Basics, `systemctl`, `journalctl`
- Firewall/iptables: iptables入門、ネットワークポート概念

### 🏆 成果物
- 構築済みサーバ環境（SSH/Web/DNS/DHCP/NTP/Mail）  
- systemd常駐化ユニット  
- フェーズ設計図・ブログ記事
