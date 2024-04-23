class Player_Controller extends Eblock_Controller {
  int bulletTimer;
  Player_Controller() {
    super();
    this.clss = "Player_Controller";
    
    speed = 0.15;
    jumpHeight = 35;
    
    bulletTimer = 0;
    
  }
  Player_Controller(JSONObject j) {
    this();
  }
  void update() {
    super.update();
    
    bulletTimer--;
    if (kb.keyDown(37) || kb.keyDown(65)) {
	  move(-1);
      }
      if (kb.keyDown(39) || kb.keyDown(68)) {
	  move(1);
      }
      if (kb.keyDown(38) || kb.keyDown(87) || kb.keyDown(32)) {
	  jump();
      }
      if (kb.keyDown(40) || kb.keyDown(83)) {
	  //jump();
      }
      
      int hgw = 30;
      	float x = mouseX - hvasX;
	float y = mouseY - hvasY;
      float a = atan2(y, x);
      if(mousePressed && this.bulletTimer < 0) {
	      world.add(new Bullet( parent.x+hgw+cos(a)*(gw*0.8),
				    parent.y+hgw+sin(a)*(hgw*2*0.8),
				    cos(a)*0.75,
				    sin(a)*0.75));
	      this.bulletTimer = 8;
      }
		
  }
}

Game_Object createMC(float x, float y) {
  Game_Object mc = new Game_Object(new Sprite("guy", 1),
                            new Physics_Body(CT_DYNAMIC, CS_AABB, 60,60),
                            null
                           );
  mc.guide = new Player_Controller();
  mc.guide.setParent(mc);
  mc.noSave = true;
  
  mc.body.box.setFriction(0.4);
  //mc.body.box.setRotate(false);
  mc.x = x;
  mc.y = y;
  return mc;
}
