Enderman em = new Enderman();
GridWorld world = new GridWorld();

float cx = 20;
float cy = -700;
float cz = 0;

int k = 0;


void setup() {
  size(800, 600, P3D);
  noStroke();
  fill(204);
}

void draw() {
  noStroke(); 
  background(50); 
         
  if (key == 'a') {
    cz += 4;
  }
  if (key == 'd') {
    cz -= 4;
  }
  
  if (key == 'w') {
    cx += 4;
  }
  if (key == 's') {
    cx -= 4;
  }
  
  camera(800*sin(cx/500), cy, 800*cos(cx/500), // eyeX, eyeY, eyeZ
     0, GS*GW*0.5, 0, // centerX, centerY, centerZ
     0.0, 1.0, 0.0); // upX, upY, upZ
  
  
  directionalLight(200, 222, 255, // Color
                   1, 0, 0); // The x-, y-, z-axis direction
                   
  directionalLight(255, 255, 255, // Color
                   0, 1, 0); // The x-, y-, z-axis direction
  
  em.update();
  
  
  translate(GS*GW*-0.5, 0, GS*GW*-0.5);
  world.draw();
  em.draw();
  
}


void keyPressed() {
}
