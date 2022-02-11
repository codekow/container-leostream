#!/bin/sh
set -e

HOME=/app

start_httpd(){
  echo httpd
}

start_guacd(){
  echo httpd
}

if [ "$1" == "" ]; then
    start_httpd
    start_guacd
else
  exec "$@"
fi
