use anyhow::Result;
use wgpu_example::run;

fn main() -> Result<()> {
    pollster::block_on(run())
}
