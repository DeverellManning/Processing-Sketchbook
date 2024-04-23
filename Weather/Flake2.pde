class Flake2 {
  float x, y;
  float vx, vy;
  float ax, ay;
  color c;
  float r;
  boolean l;
  
  Flake2(float _x, float _y, boolean _l) {
    x = _x;
    y = _y;
    vx = 0;
    vy = 0;
    
    l = _l;
    
    init();
  }
  
  void init() {
    if (l) {
      c = color(random(230, 250));
      ax = random(-3,3)*0.06;
      ay = random(-1,1)*0.06;
      r = random(4,8);
    } else {
      float b = random(60, 140);
      c = color(b, b, b+30);
      ax = random(-2,2)*0.04;
      ay = random(-1,1)*0.04;
      r = random(3,6);
    }
  }
  
  void draw() {
    if (l) {
      vx += ax + wx*0.08;
      vy += ay + wy*0.08;
    } else {
      vx += ax + wx*0.05;
      vy += ay + wy*0.05;
    }
    
    vx *= 0.9;
    vy *= 0.9;
    
    x += vx;
    y += vy;
    
    
    if (x > vasX+10) {
      x = -10;
      init();
    }
    if (x < -10) {
      x = vasX+10;
      init();
    }
    
    if (y > vasY+10) y = -10;
    if (y < -10) y = vasY+10;

    
    
    fill(c);
    circle(x, y, r);
    
    
    
  }
}
