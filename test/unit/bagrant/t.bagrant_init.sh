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
  register_options_bagrant
}

function tearDown() {
  rm -rf vmcache
  rm -rf vmconfig
}

function test_bagrant_init() {
  bagrant_init >/dev/null
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
