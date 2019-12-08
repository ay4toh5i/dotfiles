## my vim cheatsheet

- 置換
  :%s/hoge/fuga/gc

  肯定先読み：\@=
  否定先読み：\@!
  肯定後読み：\@<=
  否定後読み：\@<!

- チートシートを表示する
  :Cheatsheet

### fugitive

- git status
  :Gstatus
   → 「-」でステージングの状態の切り替え
   → 「D」でDiff、またはds,dv
   → 「U」でrevert
   → 「cc」でコミット
- git blame
  :Gblame
   [vimの便利なPlugin（その19）fugitive.vim ~ vimからGitを簡単操作](http://engineerspirit.com/2017/05/13/post-1308/)

### NERDTree
   [vim-plugin NERDTree で開発効率をアップする！](https://qiita.com/zwirky/items/0209579a635b4f9c95ee)

   
   m ディレクトリ操作
 
