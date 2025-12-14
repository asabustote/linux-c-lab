了解！
では “最も簡単で、確実にカーネルモジュールの基礎が理解できるやつ” をやります。

🥇 最も簡単なやつ：/proc/myinfo を作る（読み取りのみ）

🔧 ゴール
cat /proc/myinfo とすると
👉 モジュールが返した文字列が表示される

これができれば：
	•	カーネルモジュールをビルドできる
	•	insmod / rmmod が理解できる
	•	/proc にファイルを“生やす”意味が分かる
	•	カーネル → ユーザのデータ受け渡しが理解できる

完全無料、PC だけで OK。
最小構成なので絶対に成功できます。

⸻

📘 Step 1: カーネルモジュールのコード

proc_myinfo.c を作ってコピペしてください👇

#include <linux/init.h>
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/uaccess.h>

#define PROC_NAME "myinfo"

static ssize_t myinfo_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
{
    const char *msg = "Hello from kernel module!\n";
    return simple_read_from_buffer(buf, count, ppos, msg, strlen(msg));
}

static const struct proc_ops myinfo_fops = {
    .proc_read = myinfo_read,
};

static int __init myinfo_init(void)
{
    proc_create(PROC_NAME, 0, NULL, &myinfo_fops);
    pr_info("myinfo module loaded\n");
    return 0;
}

static void __exit myinfo_exit(void)
{
    remove_proc_entry(PROC_NAME, NULL);
    pr_info("myinfo module unloaded\n");
}

module_init(myinfo_init);
module_exit(myinfo_exit);

MODULE_LICENSE("GPL");


⸻

📘 Step 2: Makefile を作る

同じディレクトリに Makefile を作って次をコピペ👇

obj-m += proc_myinfo.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean


⸻

📘 Step 3: ビルド

make

成功すると proc_myinfo.ko ができます。

⸻

📘 Step 4: モジュールを読み込む

sudo insmod proc_myinfo.ko

dmesg でログが出ます：

dmesg | tail


⸻

📘 Step 5: 動作確認

cat /proc/myinfo

結果：

Hello from kernel module!


⸻

📘 Step 6: モジュールをアンロード

sudo rmmod proc_myinfo


⸻

🎉 おめでとう！

これで カーネル → ユーザへのデータ受け渡しの最小例 をクリア！

次にやるべきはこれ👇
	1.	読み取り + 書き込み（echo の値をカーネル側で受け取る）
	2.	内部バッファ・カウンタを持たせる
	3.	タイマーを入れて定期処理
	4.	chardev (/dev/mydev) を実装する
	5.	割り込みや同期処理を扱う

順番に全部やれば、
「カーネルモジュール書けます」と言えるレベルまで確実にいけます。

⸻

今すぐ次のステップ（読み書きできる /proc）に進みたい？
それともまずこれ動かしてみる？
