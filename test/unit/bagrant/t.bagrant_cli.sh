#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function test_bagrant_cli() {
  bagrant_cli box >/dev/null
  assertEquals $? 0
}

## shunit2

. ${shunit2_file}
