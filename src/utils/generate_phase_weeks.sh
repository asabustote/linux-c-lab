#!/bin/bash
# ============================================
# generate_phase_weeks.sh
# Linux-C-Lab 全Phase/Week Markdown自動生成
# ============================================

# --- ルートディレクトリ設定 ---
SCRIPT_DIR=$(dirname "$0")
ROOT_DIR=$(realpath "$SCRIPT_DIR/../..") # src/utils/ から2階層上がルート
DOCS_DIR="$ROOT_DIR/docs"
mkdir -p "$DOCS_DIR"

# --- フェーズ定義 ---
declare -A PHASES=(
    [1]="Phase 1: Linuxサーバ構築"
    [2]="Phase 2: C言語・スネークゲーム"
    [3]="Phase 3: TCP通信・パケット解析"
    [4]="Phase 4: 電子工作"
    [5]="Phase 5: 自作ルータ"
    [6]="Phase 6: 成果整理・転職準備"
)

# --- 各週の平日目標・土日作業・参考資料 ---
declare -A WEEK_GOALS
declare -A WEEK_WEEKEND
declare -A WEEK_REF

# ---------- Phase1 (Week01-06) ----------
WEEK_GOALS[1]="Design Week：サーバ構成、アクセス権、ポート計画、systemd理解、ネットワーク基礎"
WEEK_WEEKEND[1]="設計・構成図作成、必要パッケージ確認"
WEEK_REF[1]="SSH: man sshd_config, OpenSSH公式\nLinux基礎: Linux Command Line Basics\nsystemd: systemctl, journalctl"

WEEK_GOALS[2]="SSH設定例、鍵認証、ログ確認"
WEEK_WEEKEND[2]="SSHサーバ構築、接続テスト、systemd常駐化"
WEEK_REF[2]="SSH: man sshd_config, OpenSSH公式\nsystemd: Unit作成例"

WEEK_GOALS[3]="Nginx設定例、ドキュメントルート管理"
WEEK_WEEKEND[3]="Webサーバ構築、アクセス確認、仮想ホスト設定"
WEEK_REF[3]="Nginx Beginner’s Guide\n/etc/nginx/sites-available 構成例"

WEEK_GOALS[4]="BIND/DHCP/NTP設定例"
WEEK_WEEKEND[4]="DNS/DHCP/NTPサーバ構築、連携テスト"
WEEK_REF[4]="BIND9 ドキュメント\nISC DHCP 設定ガイド\nNTP.org 設定ガイド"

WEEK_GOALS[5]="Postfix設定、ユーザ管理、ログ確認"
WEEK_WEEKEND[5]="Mailサーバ構築、テストメール送受信、サービス連携確認"
WEEK_REF[5]="Postfix Basic Configuration\nSMTPログ解析"

WEEK_GOALS[6]="Blog Week：フェーズ振り返り、学習ポイント整理"
WEEK_WEEKEND[6]="まとめ記事作成、図解・コマンド例・トラブルシュートメモ"
WEEK_REF[6]="参考資料はこれまでのまとめ"

# ---------- Phase2 (Week07-10) ----------
WEEK_GOALS[7]="スネークゲーム仕様設計・リアルタイム処理学習"
WEEK_WEEKEND[7]="仕様書作成、termios確認"
WEEK_REF[7]="C標準ライブラリ: termios, ncurses"

WEEK_GOALS[8]="ncurses導入・サンプル実行"
WEEK_WEEKEND[8]="キー入力・画面描画サンプル作成"
WEEK_REF[8]="ncurses公式ドキュメント"

WEEK_GOALS[9]="キー入力処理(termios)実装"
WEEK_WEEKEND[9]="スネーク移動処理作成"
WEEK_REF[9]="C標準IO, termios関連資料"

WEEK_GOALS[10]="座標描画・当たり判定・スコア処理"
WEEK_WEEKEND[10]="スネークゲーム完成"
WEEK_REF[10]="ゲームプログラミングC資料"

# ---------- Phase3 (Week11-13) ----------
WEEK_GOALS[11]="Raspberry Piセットアップ、GPIO制御概要"
WEEK_WEEKEND[11]="SSH接続・固定IP設定"
WEEK_REF[11]="Raspberry Pi公式サイト, GPIO制御入門"

WEEK_GOALS[12]="LED点滅、センサー値取得プログラム"
WEEK_WEEKEND[12]="CでGPIO制御プログラム作成"
WEEK_REF[12]="Raspberry Pi GPIO Cライブラリ"

WEEK_GOALS[13]="センサー値の取得・ログ化"
WEEK_WEEKEND[13]="温湿度センサー値取得確認"
WEEK_REF[13]="I2C/SPI入門資料"

# ---------- Phase4 (Week14-17) ----------
WEEK_GOALS[14]="自動水やりシステム設計"
WEEK_WEEKEND[14]="制御仕様書作成"
WEEK_REF[14]="水ポンプ制御, GPIO応用例"

WEEK_GOALS[15]="土壌湿度センサー接続・確認"
WEEK_WEEKEND[15]="センサー測定値取得・ログ化"
WEEK_REF[15]="センサー仕様書, Raspberry Pi GPIO資料"

WEEK_GOALS[16]="水ポンプ制御プログラム作成"
WEEK_WEEKEND[16]="自動給水制御プログラム作成"
WEEK_REF[16]="C言語 PWM制御, GPIO応用"

WEEK_GOALS[17]="センサー値に応じて自動給水制御"
WEEK_WEEKEND[17]="実際に水やり制御テスト"
WEEK_REF[17]="電子工作参考サイト"

# ---------- Phase5 (Week18-25) ----------
WEEK_GOALS[18]="ネットワーク構成設計"
WEEK_WEEKEND[18]="構成図作成, 必要機材確認"
WEEK_REF[18]="TCP/IP, ルーティング, NAT資料"

WEEK_GOALS[19]="NAT, ルーティング設定"
WEEK_WEEKEND[19]="Raspberry Piルータ構築"
WEEK_REF[19]="iptables, routing資料"

WEEK_GOALS[20]="DHCP, DNS設定（dnsmasq）"
WEEK_WEEKEND[20]="DHCP/DNS設定・動作確認"
WEEK_REF[20]="dnsmasq, BIND, DHCP資料"

WEEK_GOALS[21]="hostapdでアクセスポイント作成"
WEEK_WEEKEND[21]="無線AP作成, 接続確認"
WEEK_REF[21]="hostapd公式資料"

WEEK_GOALS[22]="接続一覧・転送量表示ツール作成"
WEEK_WEEKEND[22]="Cでネットワーク監視ツール作成"
WEEK_REF[22]="Cネットワークプログラミング資料"

WEEK_GOALS[23]="ネットワーク監視ツール完成"
WEEK_WEEKEND[23]="動作確認・ログ取得"
WEEK_REF[23]="TCP/IP資料, ログ解析"

WEEK_GOALS[24]="GitHubリポジトリ整理"
WEEK_WEEKEND[24]="ソース管理整備"
WEEK_REF[24]="GitHub公式ドキュメント"

WEEK_GOALS[25]="ドキュメント・構成図作成"
WEEK_WEEKEND[25]="まとめ資料作成"
WEEK_REF[25]="Draw.io, Markdown設計資料"

# ---------- Phase6 (Week26-36) ----------
for w in $(seq 26 36); do
    WEEK_GOALS[$w]="成果整理・技術記事作成"
    WEEK_WEEKEND[$w]="ポートフォリオ作成, Qiita/Zenn記事作成, 職務経歴書更新"
    WEEK_REF[$w]="過去Phase資料, GitHub, 技術記事例"
done

# ---------- 生成ループ ----------
for week in $(seq 1 36); do
    week_name=$(printf "week%02d" "$week")

    # フェーズ決定
    if ((week <= 6)); then
        phase_dir="$DOCS_DIR/phase1"
        phase_name="${PHASES[1]}"
    elif ((week <= 10)); then
        phase_dir="$DOCS_DIR/phase2"
        phase_name="${PHASES[2]}"
    elif ((week <= 13)); then
        phase_dir="$DOCS_DIR/phase3"
        phase_name="${PHASES[3]}"
    elif ((week <= 17)); then
        phase_dir="$DOCS_DIR/phase4"
        phase_name="${PHASES[4]}"
    elif ((week <= 25)); then
        phase_dir="$DOCS_DIR/phase5"
        phase_name="${PHASES[5]}"
    else
        phase_dir="$DOCS_DIR/phase6"
        phase_name="${PHASES[6]}"
    fi

    mkdir -p "$phase_dir"
    file_path="$phase_dir/$week_name.md"

    # Markdown生成
    cat <<EOF >"$file_path"
# Week$(printf "%02d" "$week"): 📌 $phase_name

## 🎯 平日調べ物 / 今週の目標
- ${WEEK_GOALS[$week]}

## 📝 土日作業
- ${WEEK_WEEKEND[$week]}

## 📚 参考資料
$(echo -e "${WEEK_REF[$week]}" | sed 's/^/- /')

EOF

    echo "✅ $file_path 生成完了"
done
