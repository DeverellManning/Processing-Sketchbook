class Enemy_AI extends Eblock_Controller {
  Enemy_AI() {
    super();
    this.clss = "Enemy_AI";
    
    speed = 9000;
    jumpHeight = 3000;
  }
  Enemy_AI(JSONObject j) {
    this();
  }
  
  void flip() {
    if (parent.facing == D_LEFT)
	    parent.facing = D_RIGHT;
    else
      parent.facing = D_LEFT;
  }
  
  void update() {
    super.update();
    	
	if (random(100) > 96)
		flip();
		
	if (random(100) > 99)
		jump();

	//Hurt Player
	if (body.box.isTouchingBody(world.mc.body.box)) {
		world.mc.guide.hurt();
	}
	
	//Go away from walls
	if (world.pworld.getBodies(parent.x+parent.body.width*1.1,parent.y+parent.body.height*0.5).size() > 0) {
		parent.facing = D_LEFT;
	}
	
	if (world.pworld.getBodies(parent.x-parent.body.width*0.1,parent.y+parent.body.height*0.5).size() > 0) {
		parent.facing = D_RIGHT;
	}
	
	//Go toward player
	if (abs(world.mc.y - parent.y) <= 128 && abs(world.mc.x - parent.x) <= vasX ) {
		if (world.mc.x < parent.x)
			parent.facing = D_LEFT;
	
		if (world.mc.x > parent.x)
			parent.facing = D_RIGHT;
	}
	
	
	//Go away from ledges
	if (world.pworld.getBodies(parent.x+parent.body.width*1.4,parent.y+parent.body.height*1.6).size() == 0) {
		parent.facing = D_LEFT;
	}
	
	if (world.pworld.getBodies(parent.x-parent.body.width*0.4,parent.y+parent.body.height*1.6).size() == 0) {
		parent.facing = D_RIGHT;
	}
	
	if (parent.facing == D_LEFT) {
		this.move(-1);
	} else {
		this.move(1);
	}
	
				 
  }
}

Game_Object createEnemy(float x, float y) {
	Game_Object enemy = new Game_Object(x, y, L_MID, new Sprite("enemy", 1), new Physics_Body(CT_DYNAMIC, CS_AABB, 64,64));
	enemy.guide = new Enemy_AI();
	enemy.guide.setParent(enemy);
	enemy.sprite.setParent(enemy);
	//enemy.body.box.setDensity(70.0);
	return enemy;
}
