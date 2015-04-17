#!/usr/bin/env bash

if [ $# -ne 2 ]; then
    echo >&2 "Usage: $0 COMMENT SPECFILE"
    exit 1
fi

COMMENT="$1"
SPEC="$2"
USER_STR="$(git config user.name) <$(git config user.email)>"

rpmdev-bumpspec \
    --comment="${COMMENT}" \
    --userstring="${USER_STR}" \
    "${SPEC}"
