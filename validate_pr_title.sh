#!/bin/bash

PR_TITLE=$1

PATTERN="^(feat|fix|docs|style|refactor|test|chore):\ .+"

echo "Validating PR Title : $PR_TITLE"

if [[ $PR_TITLE =~ $PATTERN ]]; then
    echo "✅ PR Title is valid."
    exit 0
else
    echo "❌ Invalid PR title: '$PR_TITLE'."
    echo "PR name Title follow the pattern: '<type>: <description>' where type is one of feat, fix, docs, style, refactor, test, chore."
    exit 1
fi
