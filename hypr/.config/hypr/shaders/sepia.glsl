#version 330

uniform sampler2D tex; // The texture (frame) we are modifying
in vec2 uv; // The texture coordinates
out vec4 fragColor; // The output color

void main() {
    vec4 color = texture(tex, uv); // Get the original color of the pixel

    // Apply sepia tone transformation
    float r = color.r;
    float g = color.g;
    float b = color.b;

    fragColor.r = min(1.0, (r * 0.393) + (g * 0.769) + (b * 0.189));
    fragColor.g = min(1.0, (r * 0.349) + (g * 0.686) + (b * 0.168));
    fragColor.b = min(1.0, (r * 0.272) + (g * 0.534) + (b * 0.131));
    fragColor.a = color.a; // Preserve the alpha channel
}

