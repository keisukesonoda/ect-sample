# ect-sample
テンプレートエンジンectのサンプルです。最小限のパッケージになっています。

## 環境構築
本パッケージを動かすために必要（便利）なツールをインストールします。


### node.js
<a href="https://nodejs.org/en/" target="_blank">node.js</a>にて「INSTALL」ボタンをクリックし、手順に沿ってインストールしてください。

```
node -v
```
nodeのバージョンが表示されればインストールは完了しています。

### gulp本体
グローバルにgulpをインストールします。
```
sudo npm install -g gulp
```

### coffeescript
グローバルにcoffeescriptをインストールします。
```
sudo npm install -g coffee-script
```

## テンプレートセット
ローカルの任意のディレクトリ階層へクローンしてください。

### パッケージ
ターミナルで上記クローンしたディレクトリへ移動して
```
sudo npm install
```

gulpの起動に必要なプラグインをインストールします。

```
gulp
```

で起動します。

## ファイル構成
~~~~
ect-sample
  ├── README.md
  ├── gulpfile.coffee
  ├── package.json
  ├── app
  │   └── source
  │       ├── data
  │       │   ├── pages.yaml
  │       │   └── init.yaml
  │       └── templates
  │           ├── content
  │           │   ├── about
  │           │   │   └── index.ect
  │           │   ├── product
  │           │   │   ├── index.ect
  │           │   │   └── detail
  │           │   │       └── index.ect
  │           │   └── index.ect
  │           ├── layout
  │           │   └── layout-base.ect
  │           └── partials
  │               ├── footer.ect
  │               └── header.ect
  └── gulp
      ├── config.coffee
      └── tasks
          ├── ect-base.coffee
          ├── ect-product-detail.coffee
          ├── functions.coffee
          ├── server.cofee
          └── watch.coffee
~~~~

