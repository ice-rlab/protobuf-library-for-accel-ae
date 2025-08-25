# Installation Instructions

## Manual Installation

This page compiles the **manual** installation instructions for the `protoc` compiler, the Protobuf C++ runtime and header files with support for the Protobuf accelerator on a Linux machine.

> [!NOTE]
> These instructions are not the only way to install the compiler, C++ runtime and header files. However, they are the most straightforward way to install them. 

> [!NOTE]
> We tested this instructions with a Linux machine running Ubuntu 22.04 with an x86_64 CPU.

### 1. Clone Repo

The first step is to clone this repository. Below is the command to clone this repository using the `git` CLI tool and SSH.

```bash
git clone git@github.com:ice-rlab/protobuf-library-for-accel-ae.git
```

### 2. Update the Git Submodules

After cloning the repository, go into the local repo directory and update the git submodules.

```bash
cd protobuf-library-for-accel-ae
git submodule update --init --recursive
```

### 3. Build the `protoc` Compiler and C++ Runtime

#### 3.1 Pre-requisites

The following tools are needed:

- autoconf
- automake
- curl
- g++
- libtool
- make
- unzip

On Ubuntu/Debian, you can install these tools with the following command:

```bash
sudo apt-get install autoconf automake curl libtool g++ make unzip
```

#### 3.2 Generate the Config Script

In the root directory of your local repo execute the `autogen.sh` Bash script.

```bash
./autogen.sh
```

#### 3.3 Build the `protoc` Compiler and C++ Runtime

Then execute the following commands to build the compiler and C++ runtime:

```bash
./configure
make
```

You can run the following command to check that the build of the compiler and runtime was successful:

```bash
make check
```

> [!NOTE]
> If the `make check` fails, it is possible to continue with the install, but it is likely some features will not work correctly.

### Install `protoc` and C++ Runtime and Header Files

Run the following commands to install

- the `protoc` compiler in `/usr/local/bin`, and
- the C++ runtime in `/usr/local/lib`
- the C++ header files in `/usr/local/include/google/protobuf/`

```bash
sudo make install
sudo ldconfig # refresh the shared library cache
```

> [!TIP]
> It's recommended to rename the installed binary of the `protoc` compiler to make it clear that this version has support for the Protobuf accelerator:
> 
> ```
> sudo mv /usr/local/bin/protoc /usr/local/bin/protoc-acc
> ```

## Automated Installation

The [build-protobuf-all.sh](https://github.com/ice-rlab/protoacc/blob/master/microbenchmarks/build-protobuf-all.sh) script automates the installation of `protoc` compiler, C++ runtime and headers for both x86 and RISC-V architectures.

The script installs them in a local directory and not in the `/usr/` path.

