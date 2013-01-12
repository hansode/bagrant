#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function test_render_vm_viftab() {
  render_vm_viftab | egrep -q -w ^bagrant-eth0
  assertEquals $? 0
}

## shunit2

. ${shunit2_file}
