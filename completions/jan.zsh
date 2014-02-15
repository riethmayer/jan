if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jan jan

_jan() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(jan commands)"
  else
    completions="$(jan completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
