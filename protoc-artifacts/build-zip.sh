#!/bin/bash

if [ $# -ne 1 ]; then
  cat <<EOF
Usage: ./build-zip.sh <VERSION_NUMBER>

Example:
  ./build-zip.sh 3.0.0

This script will create .zip packages suitable to be included in the GitHub
release page from the binaries built by the `build-protoc.sh` script. For the
target protoc, well-known type .proto files will also be included. This 
script will create zip files for the corresponding available binaries:
  dist/protoc-<VERSION_NUMBER>-win32.zip
  dist/protoc-<VERSION_NUMBER>-win64.zip
  dist/protoc-<VERSION_NUMBER>-osx-x86_32.zip
  dist/protoc-<VERSION_NUMBER>-osx-x86_64.zip
  dist/protoc-<VERSION_NUMBER>-linux-x86_32.zip
  dist/protoc-<VERSION_NUMBER>-linux-x86_64.zip
  dist/protoc-<VERSION_NUMBER>-linux-aarch_64.zip
  dist/protoc-<VERSION_NUMBER>-linux-ppcle_64.zip
  dist/protoc-<VERSION_NUMBER>-linux-s390x_64.zip
EOF
  exit 1
fi

TARGET="protoc"
VERSION_NUMBER=$1

# <zip file name> <binary file name> pairs.
declare -a FILE_NAMES=( \
  # win32.zip windows-x86_32.exe \
  # win64.zip windows-x86_64.exe \
  # osx-x86_32.zip osx-x86_32.exe \
  # osx-x86_64.zip osx-x86_64.exe \
  # linux-x86_32.zip linux-x86_32.exe \
  linux-x86_64.zip ./target/linux/x86_64/protoc.exe \
  # linux-aarch_64.zip linux-aarch_64.exe \
  # linux-ppcle_64.zip linux-ppcle_64.exe \
  # linux-s390x_64.zip linux-s390x_64.exe \
)

# List of all well-known types to be included.
declare -a WELL_KNOWN_TYPES=(           \
  google/protobuf/descriptor.proto      \
  google/protobuf/any.proto             \
  google/protobuf/api.proto             \
  google/protobuf/duration.proto        \
  google/protobuf/empty.proto           \
  google/protobuf/field_mask.proto      \
  google/protobuf/source_context.proto  \
  google/protobuf/struct.proto          \
  google/protobuf/timestamp.proto       \
  google/protobuf/type.proto            \
  google/protobuf/wrappers.proto        \
  google/protobuf/compiler/plugin.proto \
)

set -e

# A temporary working directory to put all files.
TEMP_DIR=$(mktemp -d)

# Copy over well-known types.
mkdir -p ${TEMP_DIR}/include/google/protobuf/compiler
for PROTO in ${WELL_KNOWN_TYPES[@]}; do
  cp -f ../src/${PROTO} ${TEMP_DIR}/include/${PROTO}
done

# Create a README file.
cat <<EOF > ${TEMP_DIR}/README.txt
Protocol Buffers - Google's data interchange format
Copyright 2008 Google Inc.
https://developers.google.com/protocol-buffers/

This package contains a precompiled binary version of the protocol buffer
compiler (protoc) modified to work with the protobuf accelerator. This
binary is intended for users who want to use Protocol
Buffers in languages other than C++ but do not want to compile protoc
themselves. To install, simply place this binary somewhere in your PATH.

If you intend to use the included well known types then don't forget to
copy the contents of the 'include' directory somewhere as well, for example
into '/usr/local/include/'.

Please refer to our official GitHub site for more installation instructions:
  https://github.com/protocolbuffers/protobuf
EOF

mkdir -p dist
mkdir -p ${TEMP_DIR}/bin
# Create a zip file for each binary.
for((i=0;i<${#FILE_NAMES[@]};i+=2));do
  ZIP_NAME=${FILE_NAMES[$i]}
  if [ ${ZIP_NAME:0:3} = "win" ]; then
    BINARY="$TARGET.exe"
  else
    BINARY="$TARGET"
  fi
  BINARY_NAME=${FILE_NAMES[$(($i+1))]}
  if [ ! -e $BINARY_NAME ]; then
    echo "[WARNING] File $BINARY_NAME does not exist." >&2
    echo "[WARNING] Skipped $TARGET-${VERSION_NAME}-${ZIP_NAME}" >&2
    continue
  fi
  cp $BINARY_NAME ${TEMP_DIR}/bin 
  TARGET_ZIP_FILE=`pwd`/dist/$TARGET-${VERSION_NUMBER}-${ZIP_NAME}
  pushd $TEMP_DIR &> /dev/null
  mv bin/"$TARGET.exe" bin/$BINARY
  chmod +x bin/$BINARY 
  if [ "$TARGET" = "protoc" ]; then
    zip -r ${TARGET_ZIP_FILE} include bin README.txt &> /dev/null
  else
    zip -r ${TARGET_ZIP_FILE} bin &> /dev/null
  fi
  rm bin/$BINARY
  popd &> /dev/null
  echo "[INFO] Successfully created ${TARGET_ZIP_FILE}"
done
