#!/usr/bin/env bash

BRANCH_NAME=${1:-$(git rev-parse --abbrev-ref HEAD)}

# The regex pattern
PATTERN='^(feature|fix|hotfix)\/[A-Z]+-[0-9]+\/[a-z0-9\-]+$'

if [[ "$BRANCH_NAME" =~ $PATTERN ]]; then
   echo "Branch name '$BRANCH_NAME' is valid."
   exit 0
else
   echo "Branch name '$BRANCH_NAME' is invalid. It must match the pattern: $PATTERN"
   exit 1
fi
