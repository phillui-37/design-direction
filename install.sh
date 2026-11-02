#!/usr/bin/env bash
set -e

usage() {
  cat <<'USAGE'
Usage: install.sh [--dry-run | --uninstall]

Install links this repository into:
  $HOME/.agents/skills/design-direction
  $HOME/.config/alma/skills/design-direction

Only links pointing to this repository are removed by --uninstall.
USAGE
}

mode=install
case "${1-}" in
  "") ;;
  --dry-run) mode=dry-run ;;
  --uninstall) mode=uninstall ;;
  -h|--help) usage; exit 0 ;;
  *) usage >&2; exit 2 ;;
esac
if [ "$#" -gt 1 ]; then usage >&2; exit 2; fi

if [ -z "${HOME-}" ]; then
  printf '%s\n' 'HOME must be set.' >&2
  exit 2
fi

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
repo_dir=$script_dir
# Resolve a symlinked installer location to the repository directory.
while [ -L "$repo_dir/install.sh" ]; do
  link_target=$(readlink "$repo_dir/install.sh")
  case "$link_target" in
    /*) resolved=$link_target ;;
    *) resolved=$repo_dir/$link_target ;;
  esac
  repo_dir=$(CDPATH= cd -- "$(dirname -- "$resolved")" && pwd -P)
done

agent_parent=$HOME/.agents/skills
alma_parent=$HOME/.config/alma/skills
agent_target=$agent_parent/design-direction
alma_target=$alma_parent/design-direction

is_our_link() {
  candidate=$1
  [ -L "$candidate" ] || return 1
  target=$(readlink "$candidate")
  case "$target" in
    /*) target_path=$target ;;
    *) target_path=$(dirname -- "$candidate")/$target ;;
  esac
  target_dir=$(CDPATH= cd -- "$(dirname -- "$target_path")" 2>/dev/null && pwd -P) || return 1
  [ "$target_dir/$(basename -- "$target_path")" = "$repo_dir" ]
}

if [ "$mode" = uninstall ]; then
  for candidate in "$agent_target" "$alma_target"; do
    if is_our_link "$candidate"; then
      printf 'Remove link: %s\n' "$candidate"
      rm -- "$candidate"
    elif [ -e "$candidate" ] || [ -L "$candidate" ]; then
      printf 'Leave unrelated path untouched: %s\n' "$candidate" >&2
    fi
  done
  exit 0
fi

conflicts=0
for candidate in "$agent_target" "$alma_target"; do
  if [ -L "$candidate" ]; then
    if is_our_link "$candidate"; then
      printf 'Already linked: %s\n' "$candidate"
    else
      printf 'Conflict (existing symlink): %s\n' "$candidate" >&2
      conflicts=1
    fi
  elif [ -e "$candidate" ]; then
    printf 'Conflict (existing path): %s\n' "$candidate" >&2
    conflicts=1
  else
    printf 'Create link: %s -> %s\n' "$candidate" "$repo_dir"
  fi
done
if [ "$conflicts" -ne 0 ]; then
  printf '%s\n' 'No links changed; resolve conflicts and retry.' >&2
  exit 1
fi
if [ "$mode" = dry-run ]; then exit 0; fi

mkdir -p "$agent_parent" "$alma_parent"
# Preflight again after creating parents; never replace a path created concurrently.
for candidate in "$agent_target" "$alma_target"; do
  if [ -e "$candidate" ] || [ -L "$candidate" ]; then
    if ! is_our_link "$candidate"; then
      printf 'Conflict appeared during install: %s\n' "$candidate" >&2
      exit 1
    fi
  fi
done
for candidate in "$agent_target" "$alma_target"; do
  if ! is_our_link "$candidate"; then
    ln -s "$repo_dir" "$candidate"
    printf 'Installed: %s\n' "$candidate"
  fi
done
