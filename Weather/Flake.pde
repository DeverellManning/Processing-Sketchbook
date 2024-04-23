class Flake {
  float x, y;
  float vx, vy;
  color c;
  float r;
  
  Flake(float _x, float _y) {
    x = _x;
    y = _y;
    
    c = color(250);
    
    vx = random(-3,3) + wx;
    vy = random(-1,1) + wy;
    
    r = random(4,6);
  }
  void draw() {
    vx += (noise(x*0.003, (vy+millis())*0.001)-0.5)*3+wx*0.07;
    vy += (noise(y*0.002, (vx+millis())*0.001)-0.5)*3+wy*0.07;
    
    vx *= 0.8;
    vy *= 0.8;
    
    x += vx;
    y += vy;
    
    if (x > vasX) x -= vasX;
    if (x < 0) x = vasX;
    if (y > vasY) y -= vasY;
    if (y < 0) y = vasY;
    
    
    fill(c);
    circle(x, y, r);
    
    
    
  }
}
