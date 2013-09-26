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
  function create_vm() { :; }
  function hypervisor_controller_path() { echo :; }
}

function tearDown() {
  rm -f Bagrantfile
  rm -rf vmcache
  rm -rf vmconfig
}

function test_bagrant() {
  bagrant_cli init
  assertEquals 0 $?

  bagrant_cli build
  assertEquals 0 $?

  bagrant_cli up
  assertEquals 0 $?

  bagrant_cli halt
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
