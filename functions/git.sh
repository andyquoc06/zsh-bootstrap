# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

__git_files () { 
    _wanted files expl 'local files' _files     
}

# git log
function gl() {
  hash_width=10
  hash_post=",trunc"
  hash_color="yellow"

  author_width=28
  author_post=",trunc"
  author_color="green"

  subject_width=10
  subject_post=""
  subject_color="cyan"

  date_width=10
  date_post=""
  date_color="bold white"

  git log --pretty=format:"%<|(${hash_width}${hash_post})%C(${hash_color})%h%<|(${author_width}${author_post})%C(${author_color})%an%<|(${subject_width}${subject_post})%C(${subject_color})%s %C(${date_color})(%ar)" $@ | less
}

function gls() {
  git log --pretty=format:"%C(yellow)%h:%Cgreen%an %C(cyan)%s %C(bold white)(%ar)" --stat $@ | less
}

function glsf() {
  git log --pretty=format:"%C(yellow)%h:%Cgreen%an %C(cyan)%s %C(bold white)(%ar)" --stat -p $@ | less
}
