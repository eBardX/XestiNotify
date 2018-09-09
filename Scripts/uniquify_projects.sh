#!/usr/bin/env bash

if (( $# != 0 )); then
    echo "Usage: uniquify_projects.sh" 1>&2
    exit 1
fi

SCRIPTS_DIR=$(unset CDPATH && cd "${0%/*}" &>/dev/null && pwd)
MAIN_PROJECT=$(unset CDPATH && cd "$SCRIPTS_DIR"/../XestiNotify.xcodeproj &>/dev/null && pwd)
IOS_DEMO_PROJECT=$(unset CDPATH && cd "$SCRIPTS_DIR"/../Examples/XestiNotifyDemo-iOS/XestiNotifyDemo.xcodeproj &>/dev/null && pwd)
IOS_PODS_PROJECT=$(unset CDPATH && cd "$SCRIPTS_DIR"/../Examples/XestiNotifyDemo-iOS/Pods/Pods.xcodeproj &>/dev/null && pwd)

function uniquify_project() {
    local PROJECT_DIR=$1
    local PROJECT_FILE="$PROJECT_DIR"/project.pbxproj

    if ! xunique -c -p "$PROJECT_FILE" >/dev/null; then
        git add "$PROJECT_DIR"/
    fi
}

uniquify_project "$MAIN_PROJECT"
uniquify_project "$IOS_DEMO_PROJECT"
uniquify_project "$IOS_PODS_PROJECT"

exit 0
