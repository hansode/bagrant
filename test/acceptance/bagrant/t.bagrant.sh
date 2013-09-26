#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function tearDown() {
  rm -f  Bagrantfile
  rm -f  box-disk1.raw
  rm -rf vmcache
  rm -rf vmconfig
}

function test_bagrant() {
  bagrant_cli init
  assertEquals 0 $?

  bagrant_cli build
  assertEquals 0 $?

  sleep 3

  bagrant_cli halt 2>/dev/null || :
  bagrant_cli up
  assertEquals 0 $?

  sleep 3

  bagrant_cli halt
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
