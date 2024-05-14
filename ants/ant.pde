class Ant {
  int x, y;
  
  Ant (int _x, int _y) {
    x = _x;
    y = _y;
    
  }
  void update() {
    //x += xr();
    //y += xr();
    
    float n, e, s, w;
    
    n = pln.pher[x][y+1];
    e = pln.pher[x-1][y];
    s = pln.pher[x][y-1];
    w = pln.pher[x+1][y];
    
    
  }
  
  void draw() {
    push();
    translate(x*gw, y*gw);
    fill(256, 200, 0);
    circle(0, 0, gw*0.8);
    pop();
  }
}
