#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare vmconfig_path=${abs_dirname}/vmconfig.$$

## functions

function tearDown() {
  rm -f ${vmconfig_path}
}

function test_install_vm_config() {
  install_vm_config  ${vmconfig_path}
  assertEquals $? 0
}

## shunit2

. ${shunit2_file}
