class Bullet extends Game_Object {
	Bullet(float _x,float _y,float _vx,float _vy) {
		super();
		noSave = true;
		
		this.x = _x;
		this.y = _y;
		this.vx = _vx;
		this.vy = _vy;
	}
	void update() {
		/*if (grid.solidAt(tg(this.x)-1,tg(this.y))) {
			this.hit = true;
		}
		if (this.x > grid.w*gw*2 || this.x < -grid.w*gw*2) {this.hit = true;}
		if (this.y > grid.h*gw*2 || this.y < -grid.h*gw*2) {this.hit = true;}*/
		
		this.x += this.vx*game.delta;
		this.y += this.vy*game.delta;
	}
	void draw() {
		fill(140);
		circle(this.x,this.y,6);
	}
}
