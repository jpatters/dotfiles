#!/bin/bash

if [[ -f "export.tar.gz" ]]; then

    tar -zxf export.tar.gz

    mv -R export/home/* ~/

    gpg --import export/gpg/pub.gpg
    gpg --allow-secret-key-import --import export/gpg/sec.gpg

    rm -rf export
fi