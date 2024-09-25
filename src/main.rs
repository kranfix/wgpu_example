use wgpu_example::{run, RunError};

fn main() -> Result<(), RunError> {
    pollster::block_on(run())
}
