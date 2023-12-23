# libdovi-build


## how to build

### install rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# switch to nightly build
rustup default nightly
rustup override set nightly
```


### install cargo-c

```
git clone --depth=1 https://github.com/lu-zero/cargo-c.git
cd cargo-c
# 修改 ./src/build.rs,./src/install.rs 支持 tvos 平台
cargo install --path .
```


### build

```
swift run build

```


```
git clone --recursive --depth=1 https://github.com/rust-lang/rust.git
cd rust
cp config.example.toml config.toml
sed -i "s/#target =.*/target = [\"aarch64-apple-darwin\", \"x86_64-apple-darwin\", \"x86_64-apple-ios-macabi\", \"aarch64-apple-ios-macabi\", \"aarch64-apple-ios\", \"x86_64-apple-ios\", \"aarch64-apple-ios-sim\", \"aarch64-apple-tvos\", \"x86_64-apple-tvos\", \"aarch64-apple-tvos-sim\", \"x86_64-apple-tvos-sim\"]/" ./config.toml
sed -i "s/cc =.*/cc = \"1.0.83\"/" ./src/bootstrap/Cargo.toml
cargo install --path src/tools/x
./x.py build


rustup +nightly target add

rustup +nightly component add rust-src
cargo +nightly build -Zbuild-std --target aarch64-apple-tvos

cargo  build -Z build-std --target aarch64-apple-tvos
cargo  build -Z build-std --target aarch64-apple-tvos

```