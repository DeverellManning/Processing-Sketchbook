class Enemy_AI extends Eblock_Controller {
  //int bulletTimer;
  //float ly;
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
	parent.facing = true;
	//this.flipTime = this.flipDist;
  }
  
  void update() {
    super.update();
    	
	if (random(100) > 96)
		flip();
		
	if (random(100) > 99)
		jump();

	
	if (body.box.isTouchingBody(world.mc.body.box)) {
		world.mc.guide.hurt();
	}
	 
	//if(grid.solidAt(gx,gy) || ! grid.solidAt(gx,gy+1)) {
	//	flip()
	//}
	
	
	//Go away from walls
	if (world.pworld.getBodies(parent.x+parent.body.width*1.1,parent.y+parent.body.height*0.5).size() > 0) {
			parent.facing = true;
	}
	
	if (world.pworld.getBodies(parent.x-parent.body.width*0.1,parent.y+parent.body.height*0.5).size() > 0) {
			parent.facing = false;
	}
	
	//Go toward player
	if (abs(world.mc.y - parent.y) <= 128 && abs(world.mc.x - parent.x) <= 600 ) {
		if (world.mc.x < parent.x)
			parent.facing = true;
			
		if (world.mc.x > parent.x)
			parent.facing = false;
	}
	
	
	//Go away from ledges
	if (world.pworld.getBodies(parent.x+parent.body.width*1.4,parent.y+parent.body.height + 5).size() == 0) {
			parent.facing = true;
	}
	
	if (world.pworld.getBodies(parent.x-parent.body.width*0.4,parent.y+parent.body.height + 5).size() == 0) {
			parent.facing = false;
	}
	
	if (parent.facing) {
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
	//enemy.noSave = true;
	return enemy;
}
