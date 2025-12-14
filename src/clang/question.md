#lestener
-構造体の最後はデータ型？
```
typedef struct {
    void (*on_key)(int keycode);
    void (*on_click)(int x, int y);
} EventListener;
```
上記のEventListenerは構造体のデータ型？

A.EventListener型の構造体を定義している。


main()内の
    EventListener listener = {
        .on_key = key_handler,
        .on_click = click_handler
    };
では{}は何をしているのか？
A.EventListner型の変数を宣言している。
　各メンバ（フィールド）に初期値として関数ポインタを代入している。

.は何の意味があるのか
A. .はメンバ初期化演算子(designated initializer)
   構造体を宣言するときにメンバに初期値を代入するために用いる。


listener.on_key(32);
上記はlister関数のon_key()を呼び出しているのか？
