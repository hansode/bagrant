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
  function create_vm() { echo create_vm $*; }
}

function test_bagrant_build() {
  bagrant_build >/dev/null
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
