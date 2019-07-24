#!/bin/bash

export ENABLE_ALL_FEATURES=false

export PG_USER=postgres
export PG_PASS=

export API_HOSTNAME=local.forestryutils.com
export API_PROTOCOL=https
export CENTRIFUGE_URI=https://localhost:8000

# Only requred when API_PROTOCOL=https
export SSL_CERT=~/code/github.com/forestryio/forestry-app/config/local.cert.pem
export SSL_KEY=~/code/github.com/forestryio/forestry-app/config/local.key.pem
