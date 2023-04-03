// build.rs

fn main() {
    println!("cargo:rustc-cdylib-link-arg=-Wl,-undefined");
    println!("cargo:rustc-cdylib-link-arg=-Wl,dynamic_lookup");
}
