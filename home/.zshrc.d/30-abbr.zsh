# register auto-expanding abbreviations
if builtin command -v abbr &>/dev/null; then
  ABBR_SET_EXPANSION_CURSOR=1
  abbr -S gsp="git switch -" > /dev/null
  abbr -S gcb="git checkout -b %" > /dev/null
  abbr -S gcbm="git checkout -b % main" > /dev/null
  abbr -S gw="BRANCH=% && git worktree add ./worktrees/\$BRANCH -b \$BRANCH main && cd worktrees/\$BRANCH" > /dev/null
  abbr -S gwm="cd \$(git worktree list | awk '{print \$1}' | fzf --reverse)" > /dev/null
  abbr -S gwt="cd \$(git worktree list | awk '{print \$1}' | awk 'NR==1||length<m{m=length;s=\$0}END{print s}')" > /dev/null
  abbr -S gwr="git worktree remove" >  /dev/null

  abbr -S gal="gcloud auth login --update-adc" > /dev/null
fi
