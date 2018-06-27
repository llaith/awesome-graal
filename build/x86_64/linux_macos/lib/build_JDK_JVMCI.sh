#!/usr/bin/env bash

set -e
set -u
set -o pipefail

source ${SCRIPTS_LIB_DIR}/utils.sh

BASEDIR=$1
MX=$2
cd ${BASEDIR}
gitClone graalvm       \
         graal-jvmci-8 \
         "Getting Graal JVMCI for JDK8"

echo ">>> Building a JDK8 with JVMCI..."
cd ${BASEDIR}/graal-jvmci-8/
HOTSPOT_BUILD_JOBS=${HOTSPOT_BUILD_JOBS:-$(getAllowedThreads)}
echo "Setting HOTSPOT_BUILD_JOBS=${HOTSPOT_BUILD_JOBS}"
HOTSPOT_BUILD_JOBS=${HOTSPOT_BUILD_JOBS} ${MX} --java-home ${JAVA_HOME} build