

PShader lit;  
PImage brick;
PImage brickNormal;

boolean enabled = true;
    
void setup() {
  fullScreen(P3D);
  //size(800, 600, P3D);
  brick = loadImage("brickwall.jpg");
  brickNormal = loadImage("brickwall-normalmap.png");
  lit = loadShader("lit.glsl", "lit-vert.glsl");
}

void draw() {
  float veiwX = sin(mouseX*0.002)*800;
  background(0.05, 0.1, 0.9);
  if (enabled == true) {
    shader(lit);
    lit.set("veiwPos", veiwX, 400, 1000);
    lit.set("normal_map", brickNormal);
    lit.set("lightPos", cos(millis()*0.001)*1000+400, 100, 100);
  }
  
  camera(veiwX, 400.0, 1000.0, 400.0, 500.0, 0.0, 0.0, 1.0, 0.0);
  
  image(brick, 0, 0);
}
    
void mousePressed() {
  enabled = !enabled;
  if (!enabled == true) {
    resetShader();
  }
}
