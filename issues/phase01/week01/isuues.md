```
~$ curl http://localhost/index.html
```

```
<html>
<head><title>403 Forbidden</title></head>
<body>
<center><h1>403 Forbidden</h1></center>
<hr><center>nginx/1.28.0</center>
</body>
</html>
```
原因：閲覧権限なし
対応策：ファイルに対し実行権限を付与する。

現状の確認
```
$ ls -l /home/ubuntu/data/www/index.html
```
```
-rw-rw-r-- 1 ubuntu ubuntu 297 Nov 24 15:32 /home/ubuntu/data/www/index.html
```

実行権限を付与
```
sudo chmod -R 755 /data
```

上記で改善しなかった。

```
ps aux | grep nginx
```

```
root        2604  0.0  0.2  12396  5392 ?        Ss   17:07   0:00 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
nginx       3166  0.0  0.2  13628  5108 ?        S    18:28   0:00 nginx: worker process
nginx       3167  0.0  0.2  13628  4724 ?        S    18:28   0:00 nginx: worker process
ubuntu      3179  0.0  0.0   6672  1920 pts/0    S+   18:29   0:00 grep --color=auto nginx
```
原因：ファイルの所有者がubuntu。だが、nginxが実行ユーザ
対応策:ファイルの所有者をnginxに変更する

```
sudo chown -R nginx:nginx /home/ubuntu/data
```
