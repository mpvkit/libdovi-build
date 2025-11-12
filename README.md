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

### install nightly version to support tvOS arm64e target

```
# install 
rustup toolchain install nightly --profile complete
rustup default nightly

rustc -vV
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
