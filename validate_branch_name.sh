#!/bin/bash

BRANCH_NAME=$1

PATTERN="^(feature|bugfix|release)\/[a-z0-9._-]+$"

echo "Validating branch name: $BRANCH_NAME"

if [[ $BRANCH_NAME =~ $PATTERN ]]; then
    echo "✅ Branch name is valid."
    exit 0
else
    echo "❌ Invalid branch name: '$BRANCH_NAME'."
    echo "Branch name must follow the pattern: 'feature/<name>', 'bugfix/<name>', or 'release/<name>'."
    exit 1
fi
