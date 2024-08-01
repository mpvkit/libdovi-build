# libdovi-build

build scripts for [libdovi](https://github.com/quietvoid/dovi_tool)

## Installation

### Swift Package Manager

```
https://github.com/mpvkit/libdovi-build.git
```

## how to build

### install rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### build rustc support tvOS arm64e target

```
git clone https://github.com/rust-lang/rust.git -b ${{ github.event.inputs.version }}
cd rust
git apply ../patch/rust/01-tvos_arm64e_support.patch
./x check
./x build --stage 2

rustup toolchain link stage0 build/host/stage0-sysroot
rustup toolchain link stage1 build/host/stage1
rustup toolchain link stage2 build/host/stage2
rustc +stage2 -vV
```


### install cargo-c

```
cargo install cargo-c
```

### build libdovi

```bash
make build
# or build specified platforms 
make build platform=ios,macos
# or see help
make help
```
