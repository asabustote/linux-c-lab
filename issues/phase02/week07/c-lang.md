clang-format

```
# 最新版のclang-formatをインストール
sudo apt update
sudo apt install clang-format

# バージョン確認
clang-format --version
```

clang-formatの設定
.clang-formatファイルに記述する
```
# インデントスタイル
IndentWidth: 4                    # インデント幅
UseTab: false                     # タブの代わりにスペースを使用
ColumnLimit: 100                  # 1行の最大文字数

# 改行とスペース
BreakBeforeBraces: Attach        # 波括弧の位置
SpaceBeforeParens: ControlStatements  # 制御文の括弧前のスペース
AllowShortFunctionsOnASingleLine: None  # 短い関数の1行記述

# クラスと関数
AccessModifierOffset: -4          # アクセス修飾子のインデント
ConstructorInitializerIndentWidth: 4  # コンストラクタ初期化子のインデント
```

https://dexall.co.jp/articles/?p=1706

