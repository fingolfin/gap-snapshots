#!/bin/sh -ex

TMP="$1".tmp
DST="$1"

# Determine build version and date
GAP_BUILD_VERSION="4.8.9, 18-Dec-2017, build"
if command -v git >/dev/null 2>&1 ; then
  if test -d .git ; then
    GAP_BUILD_VERSION=`git describe --tags --dirty || echo`
  fi
fi
GAP_BUILD_DATE=`date +"%Y-%m-%d %H:%M:%S (%Z)"`

# Generate the file
cat > "$TMP" <<EOF
#ifndef GAP_BUILD_VERSION
#define GAP_BUILD_VERSION  "$GAP_BUILD_VERSION"
#define GAP_BUILD_DATETIME "$GAP_BUILD_DATE"
#endif
EOF

# Only copy the header over if there were any changes, to
# avoid pointless recompiles.
if ! cmp -s $TMP $DST ; then
  cp "$TMP" "$DST"
fi;

rm $TMP
