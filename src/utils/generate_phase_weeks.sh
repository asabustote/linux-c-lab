#!/bin/bash
# generate_phase_weeks.sh
# Phase1〜Phase6の週次Markdownファイルを自動生成

ROOT_DIR=$(pwd)/linux-c-lab
DOCS_DIR="$ROOT_DIR/docs"

mkdir -p "$DOCS_DIR"

# フェーズ定義
declare -A PHASES=(
    [1]="phase1"
    [2]="phase2"
    [3]="phase3"
    [4]="phase4"
    [5]="phase5"
    [6]="phase6"
)

# 各週のデータを配列にまとめる
# 書式: Week|Phase|平日学習|土日作業|参考資料|成果物|次週準備
WEEKS=(
    # Phase1
    "1|phase1|Design Week：サーバ構成、アクセス権、ポート計画、systemd理解、ネットワーク基礎|設計・構成図作成、必要パッケージ確認|Linux Command Line Basics, systemctl, journalctl|サーバ設計図|SSH設定理解"
    "2|phase1|SSH設定例、鍵認証、ログ確認|SSHサーバ構築、接続テスト、systemd常駐化|man sshd_config, OpenSSH公式|SSHサーバ稼働, systemdユニット|Webサーバ準備"
    "3|phase1|Nginx設定例、ドキュメントルート管理|Webサーバ構築、アクセス確認、仮想ホスト設定|Nginx Beginner’s Guide|Webサーバ稼働, 仮想ホスト設定|DNS/DHCP理解"
    "4|phase1|BIND/DHCP/NTP設定例|DNS/DHCP/NTPサーバ構築、連携テスト|BIND9, ISC DHCP, NTP.org|DNS/DHCP/NTP稼働|Mailサーバ準備"
    "5|phase1|Postfix設定、ユーザ管理、ログ確認|Mailサーバ構築、テストメール送受信、サービス連携確認|Postfix Basic Configuration, SMTPログ解析|Mailサーバ稼働|まとめ確認"
    "6|phase1|フェーズ振り返り、学習ポイント整理|Blog Week：まとめ記事作成、図解・コマンド例・トラブルシュートメモ|これまでの全資料|フェーズ設計図、ブログ記事|Phase2準備"

    # Phase2
    "7|phase2|C言語基礎復習（条件分岐・ループ・配列・構造体・ポインタ）|簡単なCLIツール作成（入力・表示・計算）|C Primer Plus, man gcc|CLIツール完成|スネークゲーム準備"
    "8|phase2|termiosによるリアルタイム入力理解|スネークゲーム仕様設計|ncurses入門, termiosマニュアル|スネークゲーム仕様書|ncurses導入準備"
    "9|phase2|ncurses導入・サンプル確認|キー入力・画面描画のサンプル作成|ncurses公式チュートリアル|サンプルプログラム|ゲーム描画実装準備"
    "10|phase2|スネークゲーム：キー入力処理|座標管理・当たり判定・スコア表示実装|C言語実践本, GitHub例|スネークゲーム初版完成|Phase3準備"

    # Phase3
    "11|phase3|TCP/IP基礎、ソケットAPI理解|TCPサーバ・クライアント作成、簡易通信実験|Beej’s Guide to Network Programming|TCP通信プログラム|パケット解析準備"
    "12|phase3|Wiresharkでパケット観察|パケットキャプチャと解析、通信ログ収集|Wireshark公式ガイド|パケット解析結果|Phase4準備"

    # Phase4
    "13|phase4|Raspberry Pi準備、GPIO基礎|Raspberry Piセットアップ、SSH接続|Raspberry Pi公式, Python GPIOライブラリ|GPIO制御確認|センサー制御準備"
    "14|phase4|センサー接続方法、I2C/SPI理解|温度・湿度センサー接続・データ取得|センサーメーカー資料, Raspberry Pi GPIO|センサー値取得ツール|自動水やり準備"
    "15|phase4|自動水やりシステム設計|水ポンプ制御プログラム作成|Raspberry Pi GPIO, Python制御例|自動給水システム試作|Phase5準備"

    # Phase5
    "16|phase5|Linuxルータ基礎、iptables理解|NAT、ルーティング設定実験|iptablesチュートリアル, Linuxネットワーク教本|ルータ基本構成|ネットワーク監視準備"
    "17|phase5|DHCP/DNS設定、hostapd理解|DHCPサーバ、DNSキャッシュ構築、AP作成|ISC DHCP, BIND, hostapd公式|ルータ機能確認|監視ツール作成"
    "18|phase5|Cで接続一覧・転送量表示ツール作成|ネットワーク監視ツール完成|Cネットワークプログラミング本|監視ツール完成|Phase6準備"
    "19|phase5|Phase5まとめ|ブログ記事作成|構築済みルータ, ログ・ツール|Phase5ブログ記事|Phase6準備"

    # Phase6
    "20|phase6|OS設計概要、プロセス管理、メモリ管理理解|簡易OS構造確認、テストカーネルの動作確認|OS開発本, x86アセンブラガイド|OSテスト環境構築|Phase6ブログ作成"
    "21|phase6|ドライバ・モジュール理解|簡易デバイスドライバ作成、モジュール挿入|Linux Device Drivers, Kernel Module Guide|カーネルモジュール作成|最終振り返り"
    "22|phase6|Phase6まとめ|ブログ記事作成|学習記録、サンプルコード|Phase6ブログ記事完成"
)

# ファイル生成ループ
for week_info in "${WEEKS[@]}"; do
    IFS='|' read -r WEEK_NUM PHASE WEEKDAY WEEKEND REFS OUTPUT NEXT <<<"$week_info"

    PHASE_DIR="$DOCS_DIR/$PHASE"
    mkdir -p "$PHASE_DIR"

    FILE_PATH="$PHASE_DIR/week$(printf "%02d" "$WEEK_NUM").md"

    cat <<EOF >"$FILE_PATH"
# Week$(printf "%02d" "$WEEK_NUM"): $WEEKDAY

## 🎯 平日学習内容
- $(echo "$WEEKDAY" | sed 's/,/,\n- /g')

## 🛠 土日作業
- $(echo "$WEEKEND" | sed 's/,/,\n- /g')

## 📚 参考資料
- $(echo "$REFS" | sed 's/,/,\n- /g')

## 🏆 成果物
- $(echo "$OUTPUT" | sed 's/,/,\n- /g')

## 🔜 次週準備
- $(echo "$NEXT" | sed 's/,/,\n- /g')
EOF

    echo "✅ $FILE_PATH 生成完了"
done

echo "🎉 すべての週次Markdownファイルを生成しました！"
