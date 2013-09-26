#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare vmxpart_path=${abs_dirname}/vmxpart.$$

## functions

function tearDown() {
  rm -f ${vmxpart_path}
}

function test_install_vm_xpart() {
  install_vm_xpart ${vmxpart_path}
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
