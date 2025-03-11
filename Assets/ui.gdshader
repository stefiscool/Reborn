shader_type canvas_item;

uniform int segments : hint_range(1, 20) = 5; // Number of segments
uniform vec4 color : hint_color = vec4(1.0, 0.0, 0.0, 1.0); // Segment color

void fragment() {
    float segment_width = 1.0 / float(segments);
    float segment_index = floor(UV.x / segment_width);
    
    if (mod(segment_index, 2.0) < 1.0) {
        COLOR = color;
    } else {
        COLOR = vec4(0.0, 0.0, 0.0, 1.0); // Alternating segments are black
    }
}

