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
