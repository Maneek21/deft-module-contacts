#!/usr/bin/env sh
set -eu

expected_digest='sha256:431d879dd511261346c2d38b1c6341f61eb7878ea4690ca836425b3a0c2c266d'
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

printf '%s\n' "Contacts 1.1.0 matches $expected_digest"
