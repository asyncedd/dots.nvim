// src/lib.rs

use std::ffi::*;

extern crate libc;

extern "C" {
    fn name_to_color(x: *const libc::c_char) -> i32;
}

#[no_mangle]
pub extern fn get_magenta() -> i32 {
    unsafe {
        name_to_color(CString::new("Magenta").unwrap().into_raw())
    }
}
