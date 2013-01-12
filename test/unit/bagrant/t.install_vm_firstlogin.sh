#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare vmfirstlogin_path=${abs_dirname}/firstlogin.$$

## functions

function tearDown() {
  rm -f ${vmfirstlogin_path}
}

function test_install_vm_firstlogin() {
  install_vm_firstlogin ${vmfirstlogin_path}
  assertEquals $? 0
}

## shunit2

. ${shunit2_file}
