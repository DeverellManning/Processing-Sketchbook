// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  boolean isDead;
  color tcolor;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.15);
    velocity = new PVector(random(-2, 2), random(-2, 2));
    position = l.copy();
    lifespan = 50.0;
    
    tcolor = color(random(255),random(255),random(255));
  }

  void run() {
    update();
    draw();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan--;
    
    if (lifespan < 0) {
      isDead = true;
    }
  }

  // Method to display
  void draw() {
    noStroke();
    fill(tcolor);
    circle(position.x, position.y, 50/max(lifespan,1));
  }
}

// A simple Particle class

class Particle1 {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  boolean isDead;
  color tcolor;
  float mult;

  Particle1(PVector l) {
    acceleration = new PVector(0, 0.5);
    velocity = new PVector(random(-5, 5), random(-2, 2));
    position = l.copy();
    lifespan = 50.0;
    
    tcolor = color(random(255),random(255),random(255));
    mult = random(0.9,0.98);
  }

  void run() {
    update();
    draw();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan*=mult;
    
    if (lifespan < 1) {
      isDead = true;
    }
  }

  // Method to display
  void draw() {
    noStroke();
    fill(tcolor);
    circle(position.x, position.y, lifespan);
  }
}
