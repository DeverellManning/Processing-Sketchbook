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
			remove = true;
		}
		
		ArrayList<FBody> bodies = world.pworld.getBodies(x, y);
		if (bodies.size() > 0) {
			boolean remove = false;
			
			for(FBody b : bodies) {

				if (b.isSensor())
				  continue;
         
				remove = true;
				
				if (b.getName() == null)
				  continue;
				  

				int ii = Integer.parseInt(b.getName());
				Game_Object o = world.obj.get(ii);

        if (o == null)
          continue;
          
        if (o.body.box != null) {
          o.body.box.addImpulse(vx*4500, vy*4500);
        }
        
				if (o.guide != null) {
					o.guide.hurt();
					
				}

			}
			
			if (remove)
				remove();
		}
		
		this.x += this.vx*game.delta;
		this.y += this.vy*game.delta;
	}
	void draw() {
		fill(80);
		circle(this.x,this.y,6);
	}
}
