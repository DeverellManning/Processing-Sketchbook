class Player_Controller extends Eblock_Controller {
  int bulletTimer;
  
  Player_Controller() {
    super();
    this.clss = "Player_Controller";
    
    speed = 8300;
    jumpHeight = 6750;
    
    bulletTimer = 0;
    hitTimer = 50;
    //coyoteJumpTimer = 0;
    
    health = 8;
    
  }
  Player_Controller(JSONObject j) {
    this();
  }
  void update() {
    super.update();
    
    bulletTimer--;
    hitTimer--;
    //coyoteJumpTimer--;
    
    if (kb.keyDown(37) || kb.keyDown(65)) {
	  move(-1);
	  parent.facing = true;
      }
      if (kb.keyDown(39) || kb.keyDown(68)) {
	  move(1);
	  parent.facing = false;
      }
      if (kb.keyDown(38) || kb.keyDown(87) || kb.keyDown(32)) {
	  jump();
      }
      if (kb.keyDown(40) || kb.keyDown(83)) {
	  //jump();
      }
      
      int hgw = parent.sprite.w/2;
      if(mousePressed && this.bulletTimer < 0) {
	      world.add(new Bullet( parent.x+hgw+cos(angle)*(gw*0.9),
				    parent.y+hgw+sin(angle)*(hgw*2*0.9),
				    cos(angle)*0.8,
				    sin(angle)*0.8));
	      this.bulletTimer = 7;
      }
		
  }
  void hurt() {
    if (this.hitTimer < 0) {
        this.health--;
        redTimer = 5;
	this.hitTimer = 20;
        //let hx = ((this.x+hgw) + (b.x+hgw))/2;
        //let hy = ((this.y+hgw) + (b.y+hgw))/2
        //particles.push(new HurtParticle(hx, hy));
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
  
  mc.body.box.setFriction(0.26);
  mc.body.box.setDamping(0.13);
  //mc.body.box.setDensity(3.0);
  //mc.body.box.setRotate(false);
  mc.body.box.setPosition(x, y);
  return mc;
}




Game_Object createKabob(float x, float y) {
  Game_Object Kabob = new Game_Object(x, y, L_MID, new Sprite("kabob", 2),
                                                    new Kabob_Physics(CT_STATIC, CS_AABB, 55,55)
                                                    );
  
  return Kabob;
}
