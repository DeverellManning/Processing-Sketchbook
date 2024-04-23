class Boid {
  float x, y;
  float vx, vy;
  float fitness;
  
  
  float dir;
  
  boolean remove;
  
  DNA d;
  
  Boid() {
    d = new DNA();
    
    init();
  }
  
  Boid(DNA _d) {
    d = new DNA(_d);
    init();
  }
  
  void init() {
    remove = false;
    
    x = random(vasX/2-100, vasX/2);
    y = random(vasY/2-100, vasY/2);
  }
  
  void draw() {
    if (fitness < -260) {
      world.deathCount++;
      remove = true;
    }
    float speed = map(d.get("speed"), -1, 1, 0, 5);
    float ax = d.get("ax")*speed;
    float ay = d.get("ay")*speed;
    
    PVector cv = new PVector(vasX/2 - x, vasY/2 - y);
    cv.normalize();
    ax += cv.x * d.get("cx");
    ay += cv.y * d.get("cy");
    
    //Point 1
    float a1x = map(d.get("1x"), -1, 1, 0, vasX);
    float a1y = map(d.get("1y"), -1, 1, 0, vasY);
    cv = new PVector(a1x - x, a1y - y);
    cv.normalize();
    ax += cv.x * d.get("1a");
    ay += cv.y * d.get("1a");
    
    //Point 2
    float a2x = map(d.get("2x"), -1, 1, 0, vasX);
    float a2y = map(d.get("2y"), -1, 1, 0, vasY);
    cv = new PVector(a2x - x, a2y - y);
    cv.normalize();
    ax += cv.x * d.get("2a");
    ay += cv.y * d.get("2a");
    
    //Point 3
    float a3x = map(d.get("3x"), -1, 1, 0, vasX);
    float a3y = map(d.get("3y"), -1, 1, 0, vasY);
    cv = new PVector(a3x - x, a3y - y);
    float ds = dist(x, y, a3x, a3y);
    cv.normalize();
    ax += cv.x * d.get("3a") / ds;
    ay += cv.y * d.get("3a") / ds;
    
    ax += rUnit()/4;
    ay += rUnit()/4;
    
    vx += ax;
    vy += ay;
    vx *= d.get("damp");
    vy *= d.get("damp");
    
    x += vx;
    y += vy;
    
    fill(255, fitness, 155);
    circle(x, y, 6);
    
    if (true) {
      fill(255, 0, 0, 22);
      circle(a1x, a1y, 5);
      fill(0, 255, 0, 22);
      circle(a2x, a2y, 5);
      fill(0, 0, 255, 22);
      circle(a3x, a3y, 5);
    }
    
   
  }
  
  void reward() {
    fitness += -0.25;
    
    for(Target t : world.targets) {
        fitness += t.calcSuccess(x, y);
    }
    
    if (x > vasX || y > vasY || x < 0 || y < 0) {
      fitness -= 1.8;
    }
  }
}
