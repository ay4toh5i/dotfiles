let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:base_dir = expand('~/.config/vim/dein')

  let s:toml = g:base_dir . '/dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  if has('nvim')
    let s:lsp_toml = g:base_dir . '/dein.nvim-lsp.toml'
    call dein#load_toml(s:lsp_toml, {'lazy': 0})
  else
    let s:lsp_toml = g:base_dir . '/dein.vim-lsp.toml'
    call dein#load_toml(s:lsp_toml, {'lazy': 0})
  endif

  let s:lazy_toml = g:base_dir . '/dein_lazy.toml'
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

autocmd VimEnter * call dein#call_hook('post_source')

