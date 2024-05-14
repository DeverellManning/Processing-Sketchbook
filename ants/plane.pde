class Plane {
  float [][] pher;
  
  int w, h;
  
  
  ArrayList<Ant> ants;
  
  int max;
  
  Plane(int _max) {
    w = 100;
    h = 100;
    
    pher = new float[w][h];
    for (int x = 0; x < w; x++) {
      pher[x] = new float[h];
      for (int y = 0; y < h; y++) {
        pher[x][y] = CR()*4;
      }
    }
    
    this.ants = new ArrayList<Ant>();
    
    
    this.max = _max;
  }
  
  void reset() {
    ants.clear();
    
    ants.add(new Ant(0, 0));
  }
  
  void draw() {
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        fill(pher[x][y], 40, 40);
        rect(x*gw, y*gw, gw, gw);
      }
    }
    
    for(Ant a : ants) {
        a.draw();
    }
  }
  
  void update() {
    for(Ant a : ants) {
      a.update();
        //if(cy < 1) {this.s.remove(i);}
    }
  }
  
  int add(int x,int y,int r,int g,int b,int f) {
    if(x<0||x>vasX/4) {return 2;}
    if(y<0) {return 3;}
    if (this.ants.size() > this.max) {return 4;}
    //this.s.add(new particle(x,y,r,g,b,f));
    return 0;
  }
  
  void circle(int sx,int sy,int sz,int r,int g,int b, int state) { // z = radius
      for (int x=-sz;x<sz;x++) {
        for (int y=-sz;y<sz;y++) {
          float d = dist(sx+x,sy+y, sx, sy);
          if(d < (sz) && d > (sz - 3)) {
            this.add(sx+x,sy+y, r+CR(), g+CR(), b+CR(), state);
          }
        }
      }
    
  }
  void fill_circle(int sx,int sy,int sz,int r,int g,int b, int state) { // z = radius
      for (int x=-sz;x<sz;x++) {
        for (int y=-sz;y<sz;y++) {
          float d = dist(sx+x,sy+y, sx, sy);
          if(d < (sz)) {
            this.add(sx+x,sy+y, r+CR(), g+CR(), b+CR(), state);
          }
        }
      }
    
  }
  
}
