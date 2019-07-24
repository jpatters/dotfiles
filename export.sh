#!/bin/bash

mkdir -p /tmp/export/home
cp -R ~/.aws /tmp/export/home
cp -R ~/.ssh /tmp/export/home
cp -R ~/.kube /tmp/export/home
cp -R ~/.npmrc /tmp/export/home

mkdir -p /tmp/export/home/Library/Application\ Support/Tunnelblick
cp -R ~/Library/Application\ Support/Tunnelblick/Configurations /tmp/export/home/Library/Application\ Support/Tunnelblick

mkdir -p /tmp/export/gpg
gpg --output /tmp/export/gpg/pub.gpg --armor --export 951153888085BFA5980EF41838636D5C8C43F6D5
gpg --output /tmp/export/gpg/sec.gpg --armor --export-secret-key 951153888085BFA5980EF41838636D5C8C43F6D5

tar -C /tmp -czf export.tar.gz export

rm -rf /tmp/export