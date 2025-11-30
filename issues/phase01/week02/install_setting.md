了解です。学習用に BIND9 で DNS サーバを構築する手順と設定例 を整理して紹介します。

ここでは Ubuntu 24.04 を想定、内部向け LAN DNS として設定します。

⸻

1️⃣ BIND9 インストール

sudo apt update
sudo apt install -y bind9 bind9utils bind9-doc dnsutils

	•	bind9 : DNS サーバ本体
	•	bind9utils : ユーティリティ（dig, nslookup の補助）
	•	bind9-doc : ドキュメント
	•	dnsutils : クライアントツール（dig, nslookup）

⸻

2️⃣ BIND サービス確認

sudo systemctl status bind9
sudo systemctl enable bind9

	•	サービス起動状態を確認
	•	再起動時に自動起動させる

⸻

3️⃣ 基本設定ファイル

/etc/bind/named.conf.options

options {
    directory "/var/cache/bind";

    recursion yes;             # 内部向けキャッシュDNS用
    allow-query { any; };      # 誰でも問い合わせ可（学習用）
    
    forwarders {               # 上位DNSへ転送
        8.8.8.8;
        8.8.4.4;
    };

    dnssec-validation auto;
    listen-on { any; };        # 全てのNICで待ち受け
};


⸻

4️⃣ ゾーン設定

/etc/bind/named.conf.local

zone "example.local" {
    type master;
    file "/etc/bind/zones/db.example.local";
};

	•	example.local は内部ドメイン名
	•	ゾーンファイルは /etc/bind/zones/db.example.local に作成

⸻

5️⃣ ゾーンファイル作成

sudo mkdir -p /etc/bind/zones
sudo nano /etc/bind/zones/db.example.local

内容例：

$TTL    604800
@       IN      SOA     ns1.example.local. admin.example.local. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns1.example.local.
ns1     IN      A       192.168.64.10
host1   IN      A       192.168.64.11
host2   IN      A       192.168.64.12

	•	SOA : ゾーンの起点
	•	NS : ネームサーバ指定
	•	A : ホスト名 → IP

⸻

6️⃣ 設定テスト

sudo named-checkconf        # 設定ファイル文法チェック
sudo named-checkzone example.local /etc/bind/zones/db.example.local


⸻

7️⃣ BIND 再起動

sudo systemctl restart bind9


⸻

8️⃣ DNS クエリ確認

dig @localhost host1.example.local
nslookup host1.example.local

	•	正常に IP が返れば OK

⸻

🔹 追加ポイント（学習用）
	•	/etc/resolv.conf に自分の DNS サーバ IP を追加するとクライアントから名前解決可能
	•	キャッシュを消したい場合：

sudo rndc flush

	•	内部向け DNS と外向け DNS（Google など）を組み合わせて学習可能

⸻

💡 まとめ
	•	BIND9 は軽量で学習用途なら 1 vCPU / 1GB RAM / 5GB Disk で十分
	•	基本設定→ゾーン作成→確認の流れを理解するだけで学習用 DNS が構築可能
	•	余裕があれば DNSSEC や ACL を追加して本番向けシミュレーションも可能

⸻

希望なら次のステップとして DNSサーバを Multipass で起動して LAN 内で名前解決させる環境 も作れます。

