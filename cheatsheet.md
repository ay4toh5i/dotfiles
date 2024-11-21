## my vim cheatsheet
- gd 
カーソル位置の単語の定義を関数内で探す
- gD
カーソル位置の単語をファイル内で探す
- gf
カーソル位置のファイル名のファイルを開く
- <C-^>
直前に編集していたファイルを開く
- =
インデントする
- gu
小文字にする
- gU
大文字にする
- ~
小文字と大文字を切り替える

## ヤンク
ヤンクするとレジスターに溜まっていく
:regでレジスターを確認できる
"0で前々回ヤンクした物が参照できるので
"0pなどでペーストできる。

## surround.vim
- cs"'
"hello" -> 'hello'
- ds"
"hello" -> hello
- ysiw"
hello -> "hello"
- ysiW"
hello/world -> "hello/world"
- yss"
hello world -> "hello world"

## commentary
- gcc
一行コメントアウト
- gc
選択範囲コメントアウト

## easy motion
- <LEADER> <LEADER> w

## wordとWORD
- word
アルファベット、数字、アンスコのいずれかが並んだもの、その三種類以外の非空白文字が並んだもの
- WORD
非空白文字が並んだもの

- 置換
  :%s/hoge/fuga/gc

  肯定先読み：\@=
  否定先読み：\@!
  肯定後読み：\@<=
  否定後読み：\@<!

- 改行
改行に置換するとき、\rか^Mを使用する
Ctrl + v returnを押すと^Mを入力することができる。
検索の場合は\nを入力する。

- ソート
:sortでソートできる
:sort uで重複を削除してソートできる

- json整形
:%!jq

- チートシートを表示する
:Cheatsheet

### fugitive

- git status
  :Gstatus
   → 「-」でステージングの状態の切り替え
   → 「D」でDiff、またはds,dv
   → 「U」でrevert
   → 「cc」でコミット
   → 「=」でその場で差分を表示
- git blame
  :Gblame
   [vimの便利なPlugin（その19）fugitive.vim ~ vimからGitを簡単操作](http://engineerspirit.com/2017/05/13/post-1308/)

### NERDTree
   [vim-plugin NERDTree で開発効率をアップする！](https://qiita.com/zwirky/items/0209579a635b4f9c95ee)

   
   m ディレクトリ操作
 
## Tips
 - `:messages` でエラーメッセージを確認できる
