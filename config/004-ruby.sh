#!/bin/bash

TARGET_VERSION=2.6.3
INSTALLED_VERSION=$(rbenv global)

if [[ "$TARGET_VERSION" != "$INSTALLED_VERSION" ]]; then
    rbenv init
    rbenv install $RUBY_VERSION
    rbenv global $RUBY_VERSION
fi
