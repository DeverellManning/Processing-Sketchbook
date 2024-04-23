class Bullet extends Game_Object {
	int life;
	
	Bullet(float _x,float _y,float _vx,float _vy) {
		super();
		noSave = true;
		life = 50;
		
		this.x = _x;
		this.y = _y;
		this.vx = _vx;
		this.vy = _vy;
	}
	void update(int i) {
		life--;
		if (life < 0) {
			remove();
		}
		
		ArrayList<FBody> bodies = world.pworld.getBodies(x, y);
		if (bodies.size() > 0) {
			boolean remove = false;
			
			for(FBody b : bodies) {

				if (b.isSensor())
				  continue;
         
				remove = true;
				
				//if (b.getName() == null || b.isStatic() == true)
				if (b.getName() == null)
				  continue;
				  
				int ii = Integer.parseInt(b.getName());
				Game_Object o = world.obj.get(ii);

				if (o == null || o.body == null)
				  continue;
				  
				if (o.body.box != null) {
				  o.body.box.addImpulse(vx*4500, vy*4500);
				  //if (o.body.box.isStatic() && random(1) > 0.55) {
					  //o.body.box.setStatic(false);
					  //o.body.setPosition(o.x, o.y + 5);
				  //}
				}
        
				if (o.guide != null) {o.guide.hurt();}

			}
			
			if (remove) {remove();}
		}
		
		x += vx*game.delta;
		y += vy*game.delta;
	}
	void draw() {
		fill(80);
		circle(x,y,6);
	}
}
