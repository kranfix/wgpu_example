mod errany_wasm32;

#[cfg(target_arch = "wasm32")]
pub use errany_wasm32::*;

#[cfg(not(target_arch = "wasm32"))]
use anyhow::{Context, Result};
