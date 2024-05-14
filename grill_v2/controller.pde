class Basic_Controller extends Game_Component {
  float speed;
  Basic_Controller() {
    super("Basic_Controller");
    speed = 0.1;
  }
  Basic_Controller(JSONObject j) {
    super("Basic_Controller");
    speed = j.getFloat("speed");
    
  }
  void update() {
    
    if (kb.keyDown(37) || kb.keyDown(65)) {
      parent.vx -= speed;
    }
    if (kb.keyDown(39) || kb.keyDown(68)) {
      parent.vx += speed;
    }
    if (kb.keyDown(38) || kb.keyDown(87)) {
      parent.vy -= speed;
    }
    if (kb.keyDown(40) || kb.keyDown(83)) {
      parent.vy += speed;
    }
    
  }
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setFloat("speed", speed);
    return j;
  }
}


class Eblock_Controller extends Basic_Controller {
  float jumpHeight;
  int health;
  
  int jumpTimer, hitTimer, redTimer;
  
  boolean support, touching;
  FBox gSensor;
  Physics_Body body;
  
  Eblock_Controller() {
    super();
    this.clss = "Eblock_Controller";
    speed = 1500;
    jumpHeight = 3500;
    
    jumpTimer = 0;
    hitTimer = 0;
    redTimer = 0;
    
    health = 5;
    
  }
  Eblock_Controller(JSONObject j) {
    super(j);
    this.clss = "Eblock_Controller";
    jumpHeight = j.getFloat("jumpHeight");
    jumpTimer = 0;
    hitTimer = -1;
    redTimer = 0;
    
  }
  void setParent(Game_Object _parent) {
    super.setParent(_parent);
    if (parent.body != null) {
      body = parent.body;
      body.box.setRotatable(false);
      
      body.box.setFriction(0.26);
      body.box.setDamping(0.14);
    }
  }

  void move(int dir) {
    float spd = speed;
    ArrayList<FBody> bodies = body.box.getTouching();
    if (bodies.size() == 0) {spd *= 0.4;}
    if (dir <= D_LEFT) { // Going left
      body.box.addForce(-spd, 0);
    } else { // Going right
      body.box.addForce(spd, 0);
    }
  }
  
  void jump() {
    if (jumpTimer > 0)
      return;
    
    ArrayList<FBody> bodies = world.pworld.getBodies(parent.x+parent.body.width*0.48,parent.y+parent.body.height*0.5+1);
    bodies.addAll(world.pworld.getBodies(parent.x-parent.body.width*0.48,parent.y+parent.body.height*0.5+1));
    
    for (FBody b : bodies) {
        if (! b.isSensor()) {
          body.box.addImpulse(0, -jumpHeight);
          jumpTimer = 4;
          break;
        }
    }
      
  }
  void update() {
    jumpTimer--;
    redTimer--;
    hitTimer--;
    
    if (health <= 0) {
      parent.remove();
    }
    if (parent.y > 3000) {
      health = 0;
    }
    
    
  }
  
  void hurt() {
    this.health--;
    redTimer = 4;
    //let hx = ((this.x+hgw) + (b.x+hgw))/2;
    //let hy = ((this.y+hgw) + (b.y+hgw))/2
    //particles.push(new HurtParticle(hx, hy));
}
  
  
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setFloat("jumpHeight", jumpHeight);
    j.setFloat("health", health);
    
    return j;
  }
}
