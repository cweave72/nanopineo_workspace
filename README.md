# NanoPi Neo Yocto Workspace

## Checkout

Workspace for building custom image for the NanoPi Neo.

```bash
git clone https://github.com/cweave72/nanopineo_workspace.git
git submodule update --init --recursive
```

## Build init

Use the init_ws.sh script to initialize/activate the build workspace.

After a clean checkout, to initialize the build workspace using the meta-nanopineo
template:

```bash
. init_build.sh -h

Script to initialize Yocto configuration (must be sourced).
Usage:
. init_build.sh [OPTIONS] [build_dir]
Options:
    -h --help    : Prints this message.
    --init       : Initialized the env with TEMPLATECONF.
```

To create the build directory initially:
```bash
. init_build <name_of_builddir>
```

To simply activate the environment (previously ran `--init`):

```bash
. init_build.sh
```

## Build Steps

1. Source environment from checkout directory:
`. init_build.sh`

2. Build the image:
`bitbake core-image-lab`

3. Determine the sdcard device via `lsblk`.

4. Insert an sdcard into reader and verify which device it is (i.e. sdb).
Then run from the build directory (assuming the sdcard device is `/dev/sdb`):
```bash
sudo dd \
  if=tmp/deploy/images/nanopi-neo/core-image-lab-nanopi-neo.rootfs.wic \
  of=/dev/sdb
```

5. Insert sdcard into the target and reboot.

View the tools included in the image in:
`meta-nanopineo/recipes-core/images/core-image-lab.bb`

## Connect to NanoPi NEO

The nanopi neo will DHCP an IP address when connected to a LAN.

Ping the board (note the IP address of the neo):
`ping nanopi-neo.local`

ssh to the board:
`ssh root@nanopi-neo.local`
or
`ssh root@<ip>`

