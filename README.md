# ect-sample
テンプレートエンジンectのサンプルです。最小限のパッケージになっています。

## 環境構築
本パッケージを動かすために必要なツールをインストールします。

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

でgulpの起動に必要なプラグインをインストールします。  

インストールが完了したら
```
gulp
```

で起動します。  
ローカルサーバも自動的に起動しますので、ブラウザで`localhost:8000`にアクセスしてみてください。

## ファイル構成
~~~~
ect-sample
  ├── README.md
  ├── gulpfile.coffee
  ├── package.json
  ├── app
  │   └── source
  │       ├── data
  │       │   └── pages.yaml
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

## 各ファイルの役割
ectは、大きく分けて3つの役割を持つテンプレートで構成されています。

### layout
contentをwrapするファイルです。ヘッダーやフッター等の共通部分を記述します。  
`<% content %>`箇所にコンテンツファイルの内容が挿入されます。

### content
ページ毎のコンテンツファイルです。  
`<% extend "layout/○○○○.ect" %>`でwrapするレイアウトファイルを選択します。  
`<% block 'id' : %>top<% end %>`でtopというデータ（文字列）をレイアウトファイルへ渡せます。  
レイアウトファイル側では`<%- content 'id' %>`で受け取ったデータを呼び出せます

### partial
共通のパーツファイルです。  
レイアウトファイルやコンテンツファイル内に`<% include 'partials/○○○○.ect' %>`と記述することで、該当パーツファイルを呼び出せます。  
また、`<% include 'partials/○○○○.ect', {hoge: fuga} %>`とすることでパーツファイルにデータを渡すこともできます。  
パーツファイル側では`<%- @hoge %>`と記述することで受け取ったデータ（上記の場合`fuga`）を呼び出せます。

## タグについて
ectを記述する基本的なタグは`<%  %>`になります。  
変数を定義する場合や条件分岐、ループ等を記述する場合はそのまま`<%  %>`ですが、データを出力する場合は`<%- @hoge %>`または`<%= @hoge %>`を使用します。

### エスケープ
`<%- @hoge %>`の場合はエスケープなし、`<%= @hoge %>`の場合はエスケープをします。  
たとえば`@hoge`という変数が`'<span>ほげ</span>'`だった場合、  

`<%- @hoge %>`の場合はそのまま
```
<span>ほげ</span>
```
`<%= @hoge %>`の場合はタグ部分がエスケープされ
```
&#60;span&#62;ほげ&#60;/span&#62;
```
と出力されます。

## coffeescript
ectでは、条件分岐やループ、javascriptの関数などがテンプレート上で使用できます。  
シンタックスは[coffeescript](http://coffeescript.org/)に準拠しています。

### 条件分岐

#### if
受け取ったデータが特定の条件の際に処理を加えます。
```
<% if @hoge is 'fuga' : %>
  ...
<% else %>
  ...
<% end %>
```
三項演算子の場合は
```
<% a = if @hoge is 'fuga' then 'b' else 'c' %>
```
と書きます。

#### switch
データに応じて処理を分けます。
```
<%
swith @hoge
  when 'fuga'
    a = b
  when 'piyo'
    a = c
  else
    a = d
%>
```
coffeescriptのシンタックスにより、`case`は`when`、`default`は`else`となります。


### ループ

#### 配列
`array = [0, 1, 2, 3, 4]`という配列があった場合
```
<% for num in array %>
  <%- num %>
<% end %>
```
とループすることができます。また、上記の場合は
```
<% for num in [0..4] %>
  <%- num %>
<% end %>
```
と書いても同様の結果が得られます。

#### 連想配列
`obj = {name: 'ほげ', id: 'hoge', class: 'test'}`という連想配列があった場合
```
<table>
  <% for key, val of obj : %>
    <tr>
      <th><%- key %></th>
      <td><%- val %></td>
    </tr>
  <% end %>
</table>
```
でキーとバリューを取得できます。

coffeescriptは最初クセがあるように思いますが、慣れると可読性も高く大変使いやすく思います。  
参考になるサイトもたくさん存在しますので、ぜひ利用してみてください。
