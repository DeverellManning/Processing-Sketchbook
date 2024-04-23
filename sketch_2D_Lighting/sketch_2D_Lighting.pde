/**
 * Toon Shading.
 * 
 * Example showing the use of a custom lighting shader in order  
 * to apply a "toon" effect on the scene. Based on the glsl tutorial 
 * from lighthouse 3D:
 * http://www.lighthouse3d.com/tutorials/glsl-tutorial/toon-shader-version-ii/
 */
 
PImage srcImage;
PShader toon;
boolean shaderEnabled = true;  

void setup() {
  size(640, 360, P2D);
  noStroke();
  fill(204);
  toon = loadShader("ToonFrag.glsl");
  //shader(toon);
  
  srcImage = loadImage("blue-tile.png");
}

void draw() {
  noStroke(); 
  background(0); 
  
  float mx = mouseX - 640/2;
  float my = mouseY - 360/2;
  
  float angle = atan2(mx, my);
  text(angle, 10, 10);
  
  push();
  //shader(toon);
  
  //too

  float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  
  //toon.set("x", dirX);
  
  image(srcImage, 20, 20);
  
  pop();
  
}  

void mousePressed() {
  if (shaderEnabled) {
    shaderEnabled = false;
    resetShader();
  } 
  else {
    shaderEnabled = true;
  }
}
