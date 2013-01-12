#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare vmfirstboot_path=${abs_dirname}/firstboot.$$

## functions

function tearDown() {
  rm -f ${vmfirstboot_path}
}

function test_install_vm_firstboot() {
  install_vm_firstboot ${vmfirstboot_path}
  assertEquals $? 0
}

## shunit2

. ${shunit2_file}
