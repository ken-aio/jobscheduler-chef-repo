What's this?
====
ChefでJobSchedulerをインストールすることを目的としたchef-repoです。

cookbooks / site-cookbooks
=====

* chefのコードを入れておく場所です
* cookbooks以下に下記コマンドでインストールしたコミュニティcookbookを置いています
  * `knife cookbook site install hogehoge -o cookbooks`
* site-cookbooks以下に自作のcookbookを置いています

test
====

* テストツールはserverspecを使います
* test-kitchenを使ってserverspecを動作させて検証しています
* 参考URL : http://qiita.com/yshnb/items/854a1770d0d47479ab47

How to use
====

* chef-soloでJobSchedulerを構築することを想定して作っています
* 以下のコマンドで動作します

```
$ cd (your jobscheduler chef-repo root)
$ cp config/solo_example.rb solo.rb
$ cp config/node_example.json node.json
$ echo "solo.rb と node.jsonを環境に合わせて変更して下さい"
$ chef-solo -c config/solo.rb -j role/jobscheduler.rb
```

以下のattributeが変更可能です。

* `node[:jobscheduler][:version][:major]` - インストール対象JobSchedulerのメジャーバージョンです。(1.6, 1.7など)
* `node[:jobscheduler][:version][:minor]` - インストール対象JobSchedulerのマイナーバージョンです。(4131, 4177など)
* `node[:jobscheduler][:user]` - JobSchedulerの起動ユーザです。対象のユーザはパスワードなしsudo実行権限が付与されます
* `node[:jobscheduler][:user_home]` - JobSchedulerの起動ユーザのホームディレクトリのパスです。
* `node[:jobscheduler][:engine][:database][:type]` - JobScheduler用データベースの種類です。(現時点ではpgsqlのみサポート)
* `node[:jobscheduler][:engine][:database][:host]` - JobScheduler用データベースのホスト名 or IPアドレスです。
* `node[:jobscheduler][:engine][:database][:port]` - JobScheduler用データベースのポート番号です。
* `node[:jobscheduler][:engine][:database][:root_user]` - JobScheduler用データベースのRootユーザ名です。
* `node[:jobscheduler][:engine][:database][:root_password]` - JobScheduler用データベースRootユーザのパスワードです。
* `node[:jobscheduler][:engine][:database][:schema]` - データベース名です。
* `node[:jobscheduler][:engine][:database][:user]` - データベース用ユーザ名です。
* `node[:jobscheduler][:engine][:database][:password]` - データベースユーザ用のパスワードです。

Attention
====

* DBはPostgreSQLのみに対応しています
* DBのチューニングは全くしていません
