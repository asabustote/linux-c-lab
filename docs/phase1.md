# Phase 1：Linuxサーバ構築（6週）

## 概要
SSH / Web / DNS / DHCP / NTP / Mailサーバ構築を通して、Linuxサービスの基礎理解と systemd 管理を習得する。

## 週次計画

| Week | 内容 | 平日下調べ例 | 土日集中作業 |
|------|------|---------------|---------------|
| 1 (Design Week) | フェーズ設計・環境構築計画 | Ubuntu/Archの違い、仮想環境設定、ネットワーク基礎 | サーバ構築手順作成・初期セットアップ |
| 2 | SSHサーバ構築 | OpenSSH設定、鍵認証の仕組み、ユーザ権限管理 | SSHサーバ構築、接続確認、systemd常駐 |
| 3 | Webサーバ構築 | Apache/Nginx設定、ドキュメントルート、アクセス権限 | Webサーバ構築、ポート確認、アクセス権設定 |
| 4 | DNS/DHCPサーバ構築 | BIND/DHCP設定例、ゾーンファイルの書き方、IP管理 | DNS/DHCP構築、テスト、ログ確認 |
| 5 | NTP / Mailサーバ構築 | NTP設定、Postfix/Dovecot基礎、メール送受信仕組み | サーバ構築、同期確認、メール送受信テスト |
| 6 (Blog Week) | 振り返り・技術ブログ作成 | - | フェーズ全体のまとめ記事作成、設定ファイル整理 |

## 参考資料
- 「Linux標準教科書 LPIC対応」  
- Ubuntu公式ドキュメント  
- DigitalOceanチュートリアル各種  
- manページ（systemd, sshd, apache2, bind9, dhcpd, ntpd, postfix）
