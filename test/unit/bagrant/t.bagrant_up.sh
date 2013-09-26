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
  function hypervisor_controller_path() { echo hypervisor_controller_path $*; }
}

function test_bagrant_up() {
  bagrant_up >/dev/null
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
