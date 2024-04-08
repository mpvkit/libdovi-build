# libdovi-build


## how to build

### install rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### build rustc support tvOS arm64e target

```
git clone https://github.com/cxfksword/rust.git -b tvos-arm64e
cd rust
./x check
./x build

# use local build rustc. https://rustc-dev-guide.rust-lang.org/building/how-to-build-and-run.html#creating-a-rustup-toolchain
rustup toolchain link stage0 build/host/stage0-sysroot
rustup toolchain link stage1 build/host/stage1
rustc +stage1 -vV
```


### install cargo-c

```
cargo install cargo-c
```

### build

```
swift run build

```
