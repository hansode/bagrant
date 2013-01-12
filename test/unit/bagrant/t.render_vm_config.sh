#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function test_render_vm_config() {
  local raw=
  eval "$(render_vm_config)"

  assertEquals "${raw}" "./box-disk1.raw"
}

## shunit2

. ${shunit2_file}
