#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function test_register_options_bagrant() {
  register_options_bagrant
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
