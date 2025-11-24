① SSH鍵を作成
```
ssh-keygen -t ed25519 -C "your_email@example.com"
```
途中の質問はすべて Enter でOK
→ ~/.ssh/id_ed25519 と ~/.ssh/id_ed25519.pub が作成される

② 公開鍵を GitHub に登録
##公開鍵を表示：
```
cat ~/.ssh/id_ed25519.pub
```

出てきた長い文字列をコピーして、GitHub の設定へ：
	1.	GitHub → Settings
	2.	左メニュー SSH and GPG keys
	3.	New SSH key
	4.	公開鍵を貼り付けて保存

③ リポジトリの URL を SSH 形式に変更
変更する：
```
git remote set-url origin git@github.com:asabustote/linux-c-lab.git
```

④ 接続テスト
```
ssh -T git@github.com
```

成功すると：
```
Hi asabustote! You've successfully authenticated.
```
