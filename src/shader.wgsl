// Vertex shader

// struct VertexOutput {
//     @builtin(position) clip_position: vec4<f32>,
//     @location(0) vert_pos: vec2<f32>,
// };

// @vertex
// fn vs_main(
//     @builtin(vertex_index) in_vertex_index: u32,
// ) -> VertexOutput {
//     var out: VertexOutput;
//     let x = f32(1 - i32(in_vertex_index)) * 0.5;
//     let y = f32(i32(in_vertex_index & 1u) * 2 - 1) * 0.5;
//     out.vert_pos = vec2<f32>(x, y);
//     out.clip_position = vec4<f32>(x, y, 0.0, 1.0);
//     return out;
// }

// // Fragment shader

// @fragment
// fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
//     //return vec4<f32>(in.position, 0.5, 1.0);
//     let a = 0.5;
//     let b = 0.866;
//     let x = a * in.vert_pos.x + b * in.vert_pos.y;
//     let y = -b * in.vert_pos.x + a * in.vert_pos.y;
//     return vec4<f32>(x, y, 0.5, 1.0);
// }
////////////////////////////////////////////////////////////////
// struct VertexInput {
//     @location(0) position: vec3<f32>,
//     @location(1) vert_pos: vec2<f32>,
//     @location(2) color: vec3<f32>,
// };

// struct VertexOutput {
//     @builtin(position) clip_position: vec4<f32>,
//     @location(0) color: vec3<f32>,
// };

// @vertex
// fn vs_main(
//     model: VertexInput,
// ) -> VertexOutput {
//     var out: VertexOutput;
//     out.color = model.color;
//     out.clip_position = vec4<f32>(model.position, 1.0);
    
//     let x = f32(1 - i32(in_vertex_index)) * 0.5;
//     let y = f32(i32(in_vertex_index & 1u) * 2 - 1) * 0.5;
//     out.vert_pos = vec2<f32>(x, y);

//     return out;
// }

// // Fragment shader

// @fragment
// fn fs_main(in: VertexOutput) -> @location(1) vec4<f32> {
//     let a = 0.5;
//     let b = 0.866;
//     let x = a * in.clip_position.x + b * in.clip_position.y;
//     let y = b * in.clip_position.x + a * in.clip_position.y;
    
//     return vec4<f32>(x, y, 0.4, 0.8);
//     //return vec4<f32>(in.color, 1.0);
// }

///////////////////////////////////////////////////////
struct VertexInput {
    @location(0) position: vec3<f32>,
    @location(1) tex_coords: vec2<f32>,
}

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) tex_coords: vec2<f32>,
}

@vertex
fn vs_main(
    model: VertexInput,
) -> VertexOutput {
    var out: VertexOutput;
    out.tex_coords = model.tex_coords;
    out.clip_position = vec4<f32>(model.position, 1.0);
    return out;
}

@group(0) @binding(0)
var t_diffuse: texture_2d<f32>;
@group(0) @binding(1)
var s_diffuse: sampler;

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    return textureSample(t_diffuse, s_diffuse, in.tex_coords);
}
