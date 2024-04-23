ArrayList<Flake2> snow;
ArrayList<Flake2> bsnow;

float vasX;
float vasY;

float wx, wy;

void setup() {
  size(1100, 800, P2D);
  //fullScreen(P2D);
  noStroke();
  //stroke(150);
  noCursor();
  
  vasX = width;
  vasY = height;

  wx = 0;
  wy = 3;
  
  
  snow = new ArrayList<Flake2>();
  for (int i=0;i<1000/*350*/;i++) {
    snow.add(new Flake2(random(0, vasX), random(0, vasY), true));
  }
  
  bsnow = new ArrayList<Flake2>();
  for (int i=0;i<1000;i++) {
    bsnow.add(new Flake2(random(0, vasX), random(0, vasY),false));
  }
  

}


void draw() {
  background(15);
  
  

  for (Flake2 f : bsnow) {
    f.draw();
  }
  
  //float lx, ly;
  //lx = snow.get(snow.size()-1).x;
  //ly = snow.get(snow.size()-1).y;
  for (Flake2 f : snow) {
    f.draw();
    //line(f.x, f.y, lx, ly);
    //lx = f.x;
    //ly = f.y;
  }

  
  //snow.add(new Flake2(mouseX, mouseY, true));
  //snow.remove(floor(random(0,snow.size())));
}
