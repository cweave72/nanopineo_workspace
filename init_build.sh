#!/bin/bash

# This script must be sourced.
#
(return 0 2>/dev/null) || { echo "ERROR: Must source script."; exit 1; }

usage () {
    echo "Script to initialize Yocto configuration (must be sourced)."
    echo "Usage:"
    echo ". $(basename ${BASH_SOURCE[0]}) [OPTIONS] [build_dir]"
    echo "Options:"
    echo "    -h --help    : Prints this message."
    echo "    --init       : Initialized the env with TEMPLATECONF."
}

TEMPLATE_PATH=$(pwd)/meta-nanopineo/conf/templates/bootstrap
#WKS_FILE=${TEMPLATE_PATH}/beaglebone-yocto-custom.wks

conf=
do_copy_wks=
leftoverargs=()

for arg in "$@"; do
    case $arg in
        --init)
            conf=$TEMPLATE_PATH
            do_copy_wks=1
            shift
            ;;
        -h|--help)
            usage
            return 0
            ;;
        *)
            leftoverargs+=("$1")
            shift
            ;;
    esac
done

confirm () {
    while true; do
        read -p "Continue [y/n] (RET=y): " REPLY
        case $REPLY in
            [yY]) return 0 ;;
            [nN]) return 1 ;;
            "") return 0 ;;
            *) echo "Unrecognized"; return 1 ;;
        esac
    done
}

builddir=$leftoverargs
if [ -z "$leftoverargs" ]; then
    builddir=build
fi


echo "Sourcing build environment:"
echo "TEMPLATECONF = $conf"
echo "Build dir    = $builddir"
confirm || return

# Source the environment
TEMPLATECONF=$conf source poky/oe-init-build-env $builddir

#if [[ $do_copy_wks == 1 ]]; then
#    echo "Copying ${WKS_FILE} to conf/".
#    cp -f ${WKS_FILE} conf/
#fi

unset conf
unset do_copy_wks
