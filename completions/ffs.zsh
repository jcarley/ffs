if [[ ! -o interactive ]]; then
    return
fi

compctl -K _ffs ffs

_ffs() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(ffs commands)"
  else
    completions="$(ffs completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
