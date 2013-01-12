# -*-Shell-script-*-
#
# requires:
#   bash
#

## system variables

readonly abs_dirname=$(cd ${BASH_SOURCE[0]%/*} && pwd)
readonly shunit2_file=${abs_dirname}/../../shunit2

## include files

. ${abs_dirname}/../../../functions/bagrant.sh

. ${abs_dirname}/../../../vmbuilder/kvm/rhel/6/functions/disk.sh
. ${abs_dirname}/../../../vmbuilder/kvm/rhel/6/functions/distro.sh
. ${abs_dirname}/../../../vmbuilder/kvm/rhel/6/functions/hypervisor.sh
. ${abs_dirname}/../../../vmbuilder/kvm/rhel/6/functions/inifile.sh
. ${abs_dirname}/../../../vmbuilder/kvm/rhel/6/functions/mbr.sh
. ${abs_dirname}/../../../vmbuilder/kvm/rhel/6/functions/utils.sh
. ${abs_dirname}/../../../vmbuilder/kvm/rhel/6/functions/vm.sh

## group variables

## group functions
