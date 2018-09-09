#!/usr/bin/env bash

PLIST_BUDDY=/usr/libexec/PlistBuddy
INFO_PLIST="${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"

OFFSET=40
COUNT=$(git log --oneline | wc -l)
BUILD_NUMBER=$((OFFSET + COUNT))

${PLIST_BUDDY} -c "Set :CFBundleVersion ${BUILD_NUMBER}" "$INFO_PLIST"

echo "Updated ${INFO_PLIST}"
