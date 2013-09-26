#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare vmnictab_path=${abs_dirname}/nictab.$$

## functions

function tearDown() {
  rm -f ${vmnictab_path}
}

function test_install_vm_nictab() {
  install_vm_nictab ${vmnictab_path}
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
