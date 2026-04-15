#!/bin/bash

# Configuration
BOOK_SOURCE_DIR="book"
BOOK_BUILD_DIR="build"

# Ensure build directory exists at the root
mkdir -p $BOOK_BUILD_DIR

echo "Starting build..."

# Run Docker
# We mount the current working directory (root) to /documents/
docker run --rm -v "$(pwd)":/documents/ \
  asciidoctor/docker-asciidoctor \
  asciidoctor-pdf -D $BOOK_BUILD_DIR $BOOK_SOURCE_DIR/index.adoc

echo "Build complete! Check the /$BOOK_BUILD_DIR folder."