#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=git://github.com/mgp25/curve25519-php.git
curve25519_dir=curve25519-php
echo "-----> Building Curve25519..."

### Curve25519
echo "[LOG] Downloading Curve25519"
git clone $dep_url -q
if [ ! -d "$curve25519_dir" ]; then
  echo "[ERROR] Failed to find curve25519 directory $curve25519_dir"
  exit
fi

cd $curve25519_dir

phpize
./configure
make
make install

# BUILD_DIR=$1
# ln -s $BUILD_DIR/.heroku /app/.heroku
# export PATH=/app/.heroku/php/bin:$PATH
# bash ./install
# cd
echo "important extension curve25519 into php.ini"
echo "extension=curve25519.so" >> /app/.heroku/php/etc/php/php.ini