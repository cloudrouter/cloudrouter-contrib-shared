#!/usr/bin/env bash

COMMIT_RANGE="$1"

EXIT_STATUS=0

while read line; do
    COUNT=$(git diff ${COMMIT_RANGE} $f | egrep "^[+|-]Release:" | wc -l)

    if [ ${COUNT} -lt 2 ]; then
        echo >&2 "[WARN] $line changed but release not bumped, you have been warned!"
        EXIT_STATUS=1
    fi
done < <(git diff --name-only ${COMMIT_RANGE} | grep "^.*\.spec" | uniq)

exit ${EXIT_STATUS}
