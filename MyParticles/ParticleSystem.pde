// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle1> particles;
  PVector origin;
  int t1;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle1>();
    t1 = 0;
  }

  void addParticle() {
    particles.add(new Particle1(origin));
  }

  void run() {
    t1--;
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle1 p = particles.get(i);
      p.update();
      p.draw();
      if (p.isDead) {
        particles.remove(i);
      }
    }
    
    if (t1 > 0) {
      addParticle();
    }
    if (random(80) > 79) {
      addParticle();
    }
  }
}
