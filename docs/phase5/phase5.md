# Phase 5：自作ルータ（8週）

## 概要
Linux上で自作ルータを構築し、NAT/DHCP/DNS/iptablesを理解し、LANネットワーク運用を学ぶ。

## 週次計画

| Week | 内容 | 平日下調べ例 | 土日集中作業 |
|------|------|---------------|---------------|
| 1 (Design Week) | ルータ設計・ネットワーク構成 | NAT, DHCP, DNSキャッシュ, iptables, LAN構成 | 設計図作成、LAN構成決定 |
| 2 | Linuxルータ構築 | IPフォワード、iptables基礎、ルーティングテーブル | 基本ルータ構築、LAN通信確認 |
| 3 | NAT構築 | iptables NAT設定、SNAT/DNAT | LAN間通信、外部アクセス確認 |
| 4 | DHCPサーバ構築 | dhcpd.conf、IP割当範囲管理 | DHCP割当確認、ログ確認 |
| 5 | DNSキャッシュ構築 | bind/named, キャッシュ設定、TTL管理 | 名前解決確認、キャッシュ挙動確認 |
| 6 | 監視ツール実装 | ping, portチェック, ログ取得方法 | LAN監視ツール作成、systemd常駐化 |
| 7 | 独自ルーティングロジック | ユーザ空間ルーティング、パケット転送 | 独自ルーティングプログラム作成、テスト |
| 8 (Blog Week) | 振り返り・技術ブログ作成 | - | フェーズ全体まとめ記事、設定ファイル・コード整理 |

## 参考資料
- 「Linuxネットワークプログラミング」  
- iptables公式ドキュメント  
- bind9 / dhcpd公式ドキュメント  
- Routing Table/ARP/NAT関連記事
