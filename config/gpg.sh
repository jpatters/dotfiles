#!/bin/bash

touch $HOME/.gnupg/gpg-agent.conf
echo "pinentry-program /usr/local/bin/pinentry-mac" > $HOME/.gnupg/gpg-agent.conf

touch $HOME/.gnupg/gpg.conf
echo "no-tty" > $HOME/.gnupg/gpg.conf
