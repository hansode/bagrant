#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function setUp() {
  function eval_ini() { echo eval_ini $*; }
}

function test_add_option_bagrant() {
  add_option_bagrant >/dev/null
  assertEquals $? 0
}

## shunit2

. ${shunit2_file}
