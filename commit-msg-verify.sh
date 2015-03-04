#!/usr/bin/env bash

COMMIT_RANGE="$1"
COMMIT_MSG_HOOK="$(dirname $0)/hooks/commit-msg.signoff-verify"

EXIT_STATUS=0
for COMMIT_HASH in $(git rev-list --no-merges "${COMMIT_RANGE}"); do
    SHORT=${COMMIT_HASH:0:8}

    # commit-msg
    echo -n "[commit-msg] [${SHORT}] "
    COMMIT_MSG_FILE="message.${SHORT}"
    git log -n 1 --pretty=format:%B "${COMMIT_HASH}" > "${COMMIT_MSG_FILE}"
    { ${COMMIT_MSG_HOOK} ${COMMIT_MSG_FILE} > /dev/null 2>&1 \
            && echo "PASS" ; } \
        || { echo "FAIL"; EXIT_STATUS=1; }
    rm -f ${COMMIT_MSG_FILE}
done

exit ${EXIT_STATUS}
