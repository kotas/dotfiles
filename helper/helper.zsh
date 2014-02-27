autoload colors
colors

function section() {
  echo "---------------------------------------------------------"
  echo "${fg_no_bold[blue]}## $@${reset_color}"
  echo
}

function log_error() {
  echo "${fg_no_bold[red]}[Error] $@${reset_color}" >&2
}

function log_info() {
  echo "${fg_no_bold[green]}[Info]${reset_color}  $@" >&2
}

function create_dir() {
  for target_path in "$@"; do
    if [[ ! -e "$target_path" ]]; then
      mkdir -p "$target_path"
      log_info "Created: $target_path"
    fi
  done
}

function remove_dir() {
  for target_path in "$@"; do
    if [[ -d "$target_path" ]]; then
      rm -fr "$target_path"
      log_info "Removed: $target_path"
    fi
  done
}

function symlink() {
  local src_path=$1
  local dst_path=$2

  if [[ ! -e "$src_path" ]]; then
    log_error "$src_path is not found"
    return 1
  fi

  if [[ ! -h "$dst_path" ]]; then
    ln -s "$(pwd)/$src_path" "$dst_path"
    log_info "Symlinked: $src_path -> $dst_path"
  fi
}
