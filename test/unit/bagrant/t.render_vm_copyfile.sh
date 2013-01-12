#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function test_render_vm_copyfile() {
  assertEquals "$(render_vm_copyfile | wc -l)" 0
}

## shunit2

. ${shunit2_file}
