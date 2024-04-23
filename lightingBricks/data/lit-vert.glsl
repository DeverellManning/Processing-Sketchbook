/*uniform int lightCount;
uniform vec4 lightPosition[8];
uniform vec3 lightNormal[8];
uniform vec3 lightAmbient[8];
uniform vec3 lightDiffuse[8];
uniform vec3 lightSpecular[8];      
uniform vec3 lightFalloff[8];
uniform vec2 lightSpot[8];*/

// Toon shader using per-pixel lighting. Based on the glsl 
// tutorial from lighthouse 3D:
// http://www.lighthouse3d.com/tutorials/glsl-tutorial/toon-shader-version-ii/

#define PROCESSING_TEXTURE_SHADER

uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;
uniform mat4 texMatrix;

uniform vec3 lightNormal[8];


attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec2 texCoord;

varying vec4 vertColor;
varying vec4 vertTexCoord;
varying vec4 vertNormal;
varying vec4 vertPosition;

varying vec3 vertLightDir;

void main() {
  // Vertex in clip coordinates
  gl_Position = transform * position;
  
  // Normal vector in eye coordinates is passed
  // to the fragment shader
  vertNormal = vec4(normalize(normalMatrix * normal), 1.0);
  
  // Assuming that there is only one directional light.
  // Its normal vector is passed to the fragment shader
  // in order to perform per-pixel lighting calculation.  
  vertLightDir = -lightNormal[0].xyz; 

  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);

  vertColor = color;

  vertPosition = vec4(vec3(modelview * position), 1.0);
}
