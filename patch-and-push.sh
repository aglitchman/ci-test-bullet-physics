#!/bin/bash

set -e

TARGET_DIR=$(pwd)
cd /home/linux/defold-patch
git diff --cached --binary > all.patch
cp all.patch $TARGET_DIR/all.patch
rm -f all.patch

# cp packages/glfw-3.4-arm64-linux-GLES.tar.gz $TARGET_DIR/glfw-3.4-arm64-linux.tar.gz
# cp packages/astcenc-8b0aa01-arm64-linux-GLES.tar.gz $TARGET_DIR/astcenc-8b0aa01-arm64-linux-GLES.tar.gz

cd $TARGET_DIR
git add .
# Get the next commit number by counting commits with "Update patch #" pattern
COMMIT_COUNT=$(git log --oneline --grep="Update patch #" | wc -l)
NEXT_NUMBER=$((COMMIT_COUNT + 1))
git commit -m "Update patch #$NEXT_NUMBER"
git push
