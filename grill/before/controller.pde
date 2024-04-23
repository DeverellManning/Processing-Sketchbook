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
  Physics_Body body;
  Eblock_Controller() {
    super();
    this.clss = "Eblock_Controller";
    speed = 0.15;
    jumpHeight = 35;
  }
  Eblock_Controller(JSONObject j) {
    super(j);
    this.clss = "Eblock_Controller";
    jumpHeight = j.getFloat("jumpHeight");
    
  }
  void setParent(Game_Object _parent) {
    super.setParent(_parent);
    if (parent.body != null)
      body = parent.body;
  }

  void move(int dir) {
    float spd = speed;
    //if (!body.support) {spd *= 0.3;}
    if (dir < 0) {
      //LEFT
      parent.ax -= spd;
      body.box.addForce(-2599, -5);
    } else {
      //RIGHT
      body.box.addForce(2500, -5);
    }
  }
  
  void jump() {
    //if (body.support) {
      body.box.addImpulse(0, -2000);
    //}
    
  }
  void update() {
    body.box.setRotation(0);
  }
  
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setFloat("jumpHeight", jumpHeight);
    
    return j;
  }
}
