libncurses5-dev と libncursesw5-dev は、端末（ターミナル）上で文字ベースのUIを作るためのライブラリ（ncurses）を開発用に使えるようにしたパッケージです。

⸻

✅ ncursesとは？

ncurses（New Curses）は ターミナル上で動作するUIを作るためのライブラリで、以下のような機能を提供します：
	•	カーソル移動
	•	文字や色の描画
	•	キー入力の制御（矢印キー、Fキーなど）
	•	画面の部分的な更新
	•	ウィンドウ・パネル表示

CUIゲーム（スネークゲームなど）やCLIアプリでよく使われます。

⸻

✅ libncurses5-dev とは？
	•	ncurses（通常版） の開発用ヘッダ・ライブラリ
	•	Cプログラムから #include <ncurses.h> を使ってビルドできるようにする

⸻

✅ libncursesw5-dev とは？
	•	ワイド文字（UTF-8、マルチバイト文字）対応版 ncurses の開発用パッケージ
	•	日本語・絵文字・Unicode文字を扱うならこちらが必要
	•	<ncursesw/curses.h> のようなワイド版ヘッダが使える

➤ 違いまとめ

パッケージ	用途	文字対応
libncurses5-dev	通常のncurses	ASCII中心
libncursesw5-dev	ワイド文字対応ncurses	UTF-8（日本語など）


⸻

🎮 スネークゲームを作る場合は？

日本語を扱わないならどちらでもOKですが、

UTF-8端末を使っているなら、基本は libncursesw5-dev を入れておくのがベスト。

⸻

