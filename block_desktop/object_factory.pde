
Game_Object createOrb() {
  Game_Object orb = new Game_Object(new Animated_Sprite("orb", 64, 64, 1, 6),
                            new Physics_Body(CT_DYNAMIC, CS_AABB, 64, 64),
                            new Particle_Emitter()
                           );
  orb.guide = new Eblock_Controller();
  orb.guide.setParent(orb);
  return orb;
}

Game_Object createKabob(float x, float y) {
  Game_Object Kabob = new Game_Object(x, y, L_MID, new Sprite("kabob", 2),
                                                    new Kabob_Physics(CT_STATIC, CS_AABB, 55,55)
                                                    );
  
  return Kabob;
}

Game_Object createFan(float x, float y) {
	
	float strength = 50;
	
	Fan_Physics body = new Fan_Physics(64, 64, strength);
	body.box.setPosition(x+body.width/2, y+body.height/2);
	body.airFlow.setPosition(x+body.width/2, y+body.height/2 - strength*5);
	
	Game_Object fan = new Game_Object(x, y, L_MID, new Sprite("fan", 1), body);
	
	return fan;
}

Game_Object createPortal(float x, float y) {
  Game_Object portal = new Game_Object(x, y, L_MID, new Animated_Sprite("portal", 64, 64, 1, 7),
                                                    new Portal_Physics(CT_STATIC, CS_AABB, 55,55)
                                                    );
  return portal;
}
