#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare vmexecscript_path=${abs_dirname}/execscript.$$

## functions

function tearDown() {
  rm -f ${vmexecscript_path}
}

function test_install_vm_execscript() {
  install_vm_execscript ${vmexecscript_path}
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
