#!/system/bin/sh

set -e

BAURE_VERSION="0.1"


if [ -z $BAURE_PATH ]; then
    BAURE_PATH="/sdcard/.baure"
fi

mkdir -p $BAURE_PATH/{repo,installed}

baure_help() {

    echo "baure - The missing package manager for rooted android"
    echo "Version: $BAURE_VERSION"

    echo ""

    echo "Usage:"
    echo "list, l - List Packages"
    echo "install, i - Install Packages"
    echo "remove, r - Remove Packages"
    echo "upgrade, ug - Upgrade Packages"
    echo "update, up - Update Repositories"
    echo "info, i - Show information about Packages"
    echo "help, h - Show this help"
    echo "init - Generate the environment file to eval"

}

baure_init() {
    echo "alias baure='sh $BAURE_PATH/baure'"
}

if [ "$1" = "list" ] || [ "$1" = "l" ]; then
    baure_list
elif [ "$1" = "install" ] || [ "$1" = "i" ]; then
    baure_install
elif [ "$1" = "remove" ] || [ "$1" = "r" ]; then
    baure_remove
elif [ "$1" = "upgrade" ] || [ "$1" = "ug" ]; then
    baure_upgrade
elif [ "$1" = "update" ] || [ "$1" = "up" ]; then
    baure_update
elif [ "$1" = "info" ] || [ "$1" = "i" ]; then
    baure_info
elif [ "$1" = "help" ] || [ "$1" = "h" ]; then
    baure_help
elif [ "$1" = "init" ]; then
    baure_init
elif [ -z "$1" ]; then
    echo "Error: An argument is required"
    exit 1
else
    echo "Error: Unknown argument: $1"
    exit 1
fi
