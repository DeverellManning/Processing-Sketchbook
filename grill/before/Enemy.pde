class Enemy_AI extends Eblock_Controller {
  int bulletTimer;
  float ly;
  Enemy_AI() {
    super();
    this.clss = "Enemy_AI";
    
    speed = 0.01;
    jumpHeight = 30;
  }
  Enemy_AI(JSONObject j) {
    this();
  }
  void flip() {
	parent.facing = true;
	//this.flipTime = this.flipDist;
  }
  void update() {
	  ly = parent.y;
      super.update();
      
	if (parent.facing) {
		this.move(-1);
	} else {
		this.move(1);
	}
	
	//if (
	if(ly < parent.y) {
		flip();
	 }
	//if(grid.solidAt(gx,gy) || ! grid.solidAt(gx,gy+1)) {
	//	flip()
	//}
				 
  }
}

Game_Object createEnemy(float x, float y) {
	Game_Object enemy = new Game_Object(x, y, L_MID, new Sprite("enemy", 1), new Physics_Body(CT_DYNAMIC, CS_AABB, 60,60));
	enemy.guide = new Enemy_AI();
	enemy.guide.setParent(enemy);
	enemy.body.box.setDensity(1000.0);
	enemy.noSave = true;
	return enemy;
}
