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
+ cache/vmbuilder.conf
+ cache/${distro_name}-${distro_ver}_${distro_arch}
