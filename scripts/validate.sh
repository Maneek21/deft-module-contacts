#!/usr/bin/env sh
set -eu

expected_digest='sha256:495075181043c6cb95ad4080ea894faa6c1b798b3eb2db97571d0b53ff0cbdaf'
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
module_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
deft_path=${1:-"$(dirname -- "$module_root")/Deft"}

if [ ! -f "$deft_path/scripts/modules-cli.ts" ]; then
  printf '%s\n' "No compatible Deft checkout found at '$deft_path'. Pass its path as the first argument." >&2
  exit 1
fi

output=$(cd "$deft_path" && pnpm module:check "$module_root")
printf '%s\n' "$output"

case "$output" in
  *"$expected_digest"*) ;;
  *)
    printf '%s\n' "Manifest is valid but its digest changed. Expected $expected_digest." >&2
    printf '%s\n' 'Update the version, changelog, README, and validation helpers intentionally.' >&2
    exit 1
    ;;
esac

printf '%s\n' "Contacts 1.8.0 matches $expected_digest"
