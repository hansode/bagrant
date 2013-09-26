#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare vmviftab_path=${abs_dirname}/viftab.$$

## functions

function tearDown() {
  rm -f ${vmviftab_path}
}

function test_install_vm_viftab() {
  install_vm_viftab ${vmviftab_path}
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
