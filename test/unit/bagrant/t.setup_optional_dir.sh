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

function test_setup_optional_dir() {
  setup_optional_dir
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
