Bagrant
=======

Bagrant is a kind of bash implementation of [Vagrant](http://www.vagrantup.com).

Getting Started
---------------

```
$ bagrant init
$ bagrant build
$ bagrant up
$ bagrant console
$ bagrant halt
```

Directory Structure
-------------------

### required

+ Bagrantfile

### optional

+ vmconfig/copy.txt
+ vmconfig/execscript.sh
+ vmconfig/firstboot.sh
+ vmconfig/firstlogin.sh
+ vmconfig/nictab.txt
+ vmconfig/viftab.txt

### variables

+ box-disk1.raw
+ vmcache/vmbuilder.conf
+ vmcache/${distro_name}-${distro_ver}_${distro_arch}

Bagrantfile
-----------

The Bagrantfile is a inifile used to configure Bagrant on a per-project basis.
The main function of the Bagrantfile is to described the virtual machine required for a project as well as how to configure machine.

Bagrantfiles are meant to be committed directly to version control and are expected to behave identically on any system which runs Bagrant.
The idea is that when a developer checks out some code from version control which has a Bagrantfile, that developer can simply `bagrant up` to get a fully provisioned virtual environment to develop that product.
