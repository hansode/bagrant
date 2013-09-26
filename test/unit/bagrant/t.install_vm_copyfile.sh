#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare vmcopyfile_path=${abs_dirname}/copyfile.$$

## functions

function tearDown() {
  rm -f ${vmcopyfile_path}
}

function test_install_vm_copyfile() {
  install_vm_copyfile ${vmcopyfile_path}
  assertEquals 0 $?
}

## shunit2

. ${shunit2_file}
