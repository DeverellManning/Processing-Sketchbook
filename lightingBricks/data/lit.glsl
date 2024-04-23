#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform sampler2D normal_map;
uniform vec2 texOffset;
uniform vec3 veiwPos;
uniform vec3 lightPos;

varying vec4 vertColor;
varying vec4 vertTexCoord;
varying vec4 vertNormal;
varying vec4 vertPosition;

varying vec3 vertLightDir;

void main(void) {
  vec3 color = texture2D(texture, vertTexCoord.xy).rgb;
  vec3 normal = texture2D(normal_map, vertTexCoord.xy).rgb;

  vec3 lightColor = vec3(1.0, 0.94, 0.9);
  //vec3 lightPos = vec3(100);
  float ambientStrength = 0.07;
  float diffuseStrength = 0.6;
  float specularStrength = 0.7;

  //vec3 norm = normalize(vec3(0.0, 0.0, 1.0)).xyz;
  vec3 norm = normalize(normal * 2.0 - 1.0);
  vec3 lightDir = normalize(lightPos - vertPosition.xyz);
  vec3 veiwDir = normalize(veiwPos - vertPosition.xyz);
  vec3 reflectDir = reflect(-lightDir, norm);
  vec3 ambient = ambientStrength * lightColor;

  float diff = max(dot(norm, lightDir), 0.0);
  vec3 diffuse = diffuseStrength * diff * lightColor;
  
  float spec = pow(max(dot(veiwDir, reflectDir), 0.0), 12); 
  vec3 specular = specularStrength * spec * lightColor;

  vec3 result = (ambient + diffuse + specular) * color;
  gl_FragColor = vec4(result, 1.0);
}
