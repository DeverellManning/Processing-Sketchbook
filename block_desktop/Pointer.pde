class Pointer extends Game_Object {
	Pointer() {
		super(new Sprite("arrow", 1),
              new Physics_Body(CT_DYNAMIC, CS_AABB, 40,40),
              null);
        
	}
	
	void update(int i) {
		
		
		

		
		body.update();
		body.box.setName("" + i);
		body.box.addImpulse(displayWidth/2+mouseX,displayHeight/2+mouseY);
		//body.box.addForce(0, -world.gravity*2);
		
		
		if (sprite != null) {sprite.update();}
		if (aura != null) {aura.update();}
		if (guide != null) {guide.update();}
	}
	
}
