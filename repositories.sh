#!/bin/bash
set -eo pipefail

# Update repositories.txt: ghq list > repositories.txt

if ! type ghq >/dev/null 2>&1; then
  echo "ghq is not installed. Please install ghq first."
  exit 1
fi

echo "Cloning repositories..."

cat repositories.txt | ghq get -p --parallel
