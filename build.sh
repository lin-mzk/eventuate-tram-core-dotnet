#!/usr/bin/env bash

set -e
set -x

# Always a preview version for now
IS_PREVIEW=true

VERSION_PREFIX='""'
if [[ ${IS_PREVIEW} = true ]] ; then
    VERSION_PREFIX=preview-${GITHUB_RUN_NUMBER}
fi

PROPS="-p:PackageId=${PACKAGE_ID} -p:RepositoryUrl=https://github.com/${GITHUB_REPOSITORY}"

dotnet build -c Release --version-suffix ${VERSION_PREFIX} ${PROPS}

dotnet pack -c Release --no-build --version-suffix ${VERSION_PREFIX} ${PROPS} IO.Eventuate.Tram
