# my vim cheatsheet

## General key mappings

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

- `<LEADER> <LEADER> w`

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

## Tips

- `:messages` でエラーメッセージを確認できる

---

## neovim

### spectre

グローバル検索&置換

- `:Spectre`

### nvim-treesitter-textsubjects

visualモードで `.` でいい感じにテキスト選択

- `.` : いい感じに選択、繰り返しかのう
- `;` : コンテナの外側選択
- `i;`: コンテナの内側選択

### scratch

一時ファイルでコーディング

- `:Scratch`

### code snap

選択範囲をスクショ

- `<leader>cs` : saving into clipboard
- `<leader>cS` : saving into file
