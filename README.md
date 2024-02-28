## About this repo
This project aims on setting up a VM with the APM solution Uptrace and its dependencies, Clickhouse and PostgreSQL
We rely on vagrant-libvirt provider

## Prerequisites

1. Working Vagrant setup
  Arch Linux users, refer the above links for documentation: 
  https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/
  https://www.adaltas.com/en/2018/09/19/kvm-vagrant-archlinux/

2. 4 Gig + RAM workstation

## Bring Up the Uptrace VM

To provision the Uptrace VM, execute the following commands.

```shell
git clone https://bitbucket.org/vericodeio/vagrant-libvirt-uptrace.git
cd vagrant-libvirt-uptrace
vagrant up --provider=libvirt --no-parallel
```

## To shutdown the Uptrace VM,

```shell
vagrant halt
```

## To restart the Uptrace VM,

```shell
vagrant up
```

## To destroy the Uptrace VM,

```shell
vagrant destroy -f
```

