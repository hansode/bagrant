#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function test_hypervisor_controller_path() {
  hypervisor=kvm

  [[ -f $(hypervisor_controller_path) ]]
  assertEquals $? 0
}

## shunit2

. ${shunit2_file}
