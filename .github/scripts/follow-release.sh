#!/usr/bin/env bash
: <<'HEADER'
===============================================================================
 Family Chalk Planner for Home Assistant | Scripts | follow-release.sh
===============================================================================
 Version:   0.17.1
 Author:    Joshua D. Miller, Claude
 Created:   2026-11-14
 Updated:   2026-11-14

 Purpose:
     Keeps the app in step with the board: reads the newest release of
     joshua-d-miller/family-chalk-planner, checks its image is published
     (ghcr.io/joshua-d-miller/family-chalk-planner:<version>), then sets
     that version in family-chalk-planner/config.yaml and adds its notes
     to the app's CHANGELOG.md. Home Assistant then offers the update.
     Nothing to do (already there, or the image isn't up yet)? Changes
     nothing. Run by .github/workflows/follow-releases.yaml.

 Returns:
     changed=true|false in $GITHUB_OUTPUT (when set), and the version.
===============================================================================
 CHANGELOG
===============================================================================
 Version   Date         Author    Description
 -------   ----------   -------   --------------------------------------------
 0.17.1    2026-11-14   joshua    New file.
                        claude
===============================================================================
HEADER

set -euo pipefail
BOARD="${BOARD_REPO:-joshua-d-miller/family-chalk-planner}"
IMAGE="${IMAGE:-joshua-d-miller/family-chalk-planner}"
CONFIG="family-chalk-planner/config.yaml"
CHANGES="family-chalk-planner/CHANGELOG.md"
out() { [ -n "${GITHUB_OUTPUT:-}" ] && echo "$1" >> "$GITHUB_OUTPUT"; echo "$1"; }

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: #
### ---------------------------- ###
### | The board's newest release | ###
### ---------------------------- ###
auth=()
[ -n "${GH_TOKEN:-}" ] && auth=(-H "Authorization: Bearer $GH_TOKEN")
release="$(curl -fsSL "${auth[@]}" -H 'Accept: application/vnd.github+json' "https://api.github.com/repos/$BOARD/releases/latest")"
tag="$(jq -r .tag_name <<<"$release")"
version="${tag#v}"
[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "Unexpected release tag: $tag"; exit 1; }
current="$(sed -n 's/^version: *"\{0,1\}\([^"]*\)"\{0,1\} *$/\1/p' "$CONFIG")"
if [ "$current" = "$version" ]; then out "changed=false"; echo "Already on $version"; exit 0; fi

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: #
### ------------------------------------------------- ###
### | Its image, published under the plain version | ###
### ------------------------------------------------- ###
### Home Assistant pulls <image>:<version>: offering the update before the  ###
### image is there would fail the install.                                   ###
pull="$(curl -fsSL "https://ghcr.io/token?scope=repository:$IMAGE:pull" | jq -r .token)"
if ! curl -fsSI -o /dev/null -H "Authorization: Bearer $pull" \
     -H 'Accept: application/vnd.oci.image.index.v1+json, application/vnd.docker.distribution.manifest.list.v2+json' \
     "https://ghcr.io/v2/$IMAGE/manifests/$version"; then
  out "changed=false"; echo "The image for $version isn't published yet: trying again later"; exit 0
fi

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: #
### ---------------------------- ###
### | The app's version and notes | ###
### ---------------------------- ###
sed -i "s/^version: .*/version: \"$version\"/" "$CONFIG"
notes="$(jq -r '.body // ""' <<<"$release")"
{
  head -n 5 "$CHANGES"
  printf '## %s\n\n%s\n\nFull notes: https://github.com/%s/releases/tag/%s\n\n' "$version" "$notes" "$BOARD" "$tag"
  tail -n +6 "$CHANGES"
} > "$CHANGES.new"
mv "$CHANGES.new" "$CHANGES"
out "changed=true"
out "version=$version"
echo "Now following $version (was $current)"
