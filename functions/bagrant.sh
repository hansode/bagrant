# -*-Shell-script-*-
#
# description:
#  tool for building complete development environments
#
# requires:
#  bash, pwd
#  cat, mkdir, cp
#  vmbuilder/kvm/rhel/6/misc/kvm-ctl.sh
#  vmbuilder/kvm/rhel/6/misc/openvz-ctl.sh
#  vmbuilder/kvm/rhel/6/misc/lxc-ctl.sh
#
# import:
#  vm: create_vm
#

function register_options_bagrant() {
  bagrantfile_path=${bagrantfile_path:-./Bagrantfile}
  vmconfig_dir=./vmconfig
  vmcache_dir=./vmcache
}

function add_option_bagrant() {
  . ${bagrantfile_path}
}

## renderering

function render_vm_xpart() {
  cat <<-'EOS'
	# /boot  128
	root    4096
	# /opt  1024
	swap    1024
	# /home 1024
	# /usr  1024
	# /var  1024
	# /tmp  1024
	EOS
}

function render_vm_nictab() {
  cat <<-'EOS'
	ifname=eth0 ip= mask= net= bcast= gw= dns="" onboot=yes
	EOS
}

function render_vm_viftab() {
  cat <<-'EOS'
	bagrant-eth0 - vboxbr0
	EOS
}

function render_vm_copyfile() {
  cat <<-'EOS'
	EOS
}

function render_vm_execscript() {
  cat <<-'EOS'
	#!/bin/bash
	#
	# requires:
	#  bash
	#
	set -e
	
	# chroot directory is given in first argument.
	declare chroot_dir=$1

	# chroot ${chroot_dir} yum update -y
	EOS
}

function render_vm_firstlogin() {
  cat <<-'EOS'
	#!/bin/bash
	#
	# requires:
	#  bash
	#
	set -e
	EOS
}

function render_vm_firstboot() {
  cat <<-'EOS'
	#!/bin/bash
	#
	# requires:
	#  bash
	#
	set -e
	EOS
}

## installing files

function install_vm_xpart() {
  local file_path=$1
  [[ -n "${file_path}" ]] || { echo "[ERROR] Invalid argument: file_path:${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  render_vm_xpart > ${file_path}
}

function install_vm_nictab() {
  local file_path=$1
  [[ -n "${file_path}" ]] || { echo "[ERROR] Invalid argument: file_path:${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  [[ -f "${file_path}" ]] || render_vm_nictab > ${file_path}
}

function install_vm_viftab() {
  local file_path=$1
  [[ -n "${file_path}" ]] || { echo "[ERROR] Invalid argument: file_path:${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  [[ -f "${file_path}" ]] || render_vm_viftab > ${file_path}
}

function install_vm_copyfile() {
  local file_path=$1
  [[ -n "${file_path}" ]] || { echo "[ERROR] Invalid argument: file_path:${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  [[ -f "${file_path}" ]] || render_vm_copyfile > ${file_path}
}

function install_vm_execscript() {
  local file_path=$1
  [[ -n "${file_path}" ]] || { echo "[ERROR] Invalid argument: file_path:${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  [[ -f "${file_path}" ]] || render_vm_execscript > ${file_path}
}

function install_vm_firstlogin() {
  local file_path=$1
  [[ -n "${file_path}" ]] || { echo "[ERROR] Invalid argument: file_path:${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  [[ -f "${file_path}" ]] || render_vm_firstlogin > ${file_path}
}

function install_vm_firstboot() {
  local file_path=$1
  [[ -n "${file_path}" ]] || { echo "[ERROR] Invalid argument: file_path:${file_path} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  [[ -f "${file_path}" ]] || render_vm_firstboot > ${file_path}
}

function setup_optional_dir() {
  [[ ! -f "${bagrantfile_path}" ]] || add_option_bagrant
  [[ -d "${vmconfig_dir}" ]] || mkdir -p ${vmconfig_dir}
  [[ -d "${vmcache_dir}"  ]] || mkdir -p ${vmcache_dir}
}

## bagrant

function bagrant_box() {
  # via http://jazstudios.blogspot.jp/2012/03/basic-vagrant-usage.html
  # cd ~/.vagrant.d/
  #
  # list|add|remove
  #
  # http://docs.vagrantup.com/v2/docs/boxes.html
  set ${CMD_ARGS}; shift
  echo box $*
}

function bagrant_init() {
  #
  # cd ~/Sites/VM/test/
  # bagrant init
  # bagrant init [name]
  #
  [[ -f "${bagrantfile_path}" ]] || cp  ${BASH_SOURCE[0]%/*}/../examples/Bagrantfile ${bagrantfile_path}
  echo "[INFO] Created ${bagrantfile_path}"

  setup_optional_dir

  install_vm_xpart      ${vmconfig_dir}/xpart.txt
  install_vm_nictab     ${vmconfig_dir}/nictab.txt
  install_vm_viftab     ${vmconfig_dir}/viftab.txt
  install_vm_copyfile   ${vmconfig_dir}/copy.txt
  install_vm_execscript ${vmconfig_dir}/execscript.sh
  install_vm_firstlogin ${vmconfig_dir}/firstlogin.sh
  install_vm_firstboot  ${vmconfig_dir}/firstboot.sh
  echo "[INFO] Created ${vmconfig_dir}"
}

function bagrant_build() {
  distro_dir=${vmcache_dir}/${distro_name}-${distro_ver}_${distro_arch}
  create_vm
}

function bagrant_up() {
  $(hypervisor_controller_path) start --config-path=${bagrantfile_path}
}

function bagrant_halt() {
  $(hypervisor_controller_path) stop --config-path=${bagrantfile_path}
}

function bagrant_console() {
  $(hypervisor_controller_path) console --config-path=${bagrantfile_path}
}

function hypervisor_controller_path() {
  echo ${BASH_SOURCE[0]%/*}/../vmbuilder/kvm/rhel/6/misc/${hypervisor}-ctl.sh
}

function bagrant_cli() {
  local cmd=$1
  [[ -n "${cmd}" ]] || { echo "[ERROR] Invalid argument: cmd:${cmd} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2; return 1; }

  case "${cmd}" in
  box)
    bagrant_box
    ;;
  init|build|up|console|halt)
    register_options_bagrant
    setup_optional_dir

    eval bagrant_${cmd}
    ;;
  *)
    echo "[ERROR] unknown command: ${cmd} (${BASH_SOURCE[0]##*/}:${LINENO})" >&2
    return 1
    ;;
  esac
}
