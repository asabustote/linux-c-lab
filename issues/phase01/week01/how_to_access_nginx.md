#nginxで起動しているサーバへのcurlでのアクセスは、
```
curl http://<ip address>
```

#アクセス権限系のエラーが発生した
```
<html>
<head><title>403 Forbidden</title></head>
<body>
<center><h1>403 Forbidden</h1></center>
<hr><center>nginx/1.28.0</center>
</body>
</html>
```
解決の糸口をつかむには...
まずはエラーログを見てみる
```
sudo tail -f /var/log/nginx/error.log
```

#原因はcurlがファイルを読み取れないこと

```
home/ubuntu
```

```
drwxr-x---  ubuntu ubuntu
```
であり、ファイルの読み書き実行のできるユーザがubuntu、ファイルを読めるのはubuntuグループ、その他は何もできない。

よって、403エラー。

#上記を解決するには、、、
その他のユーザも実行できるよう権限を付与する

```
sudo chmod 711 /home/ubuntu
```
