Game_Object createFan(float x, float y) {
	
	float strength = 50;
	
	Fan_Physics body = new Fan_Physics(64, 64, strength);
	body.box.setPosition(x+body.box.getWidth()/2, y+body.box.getHeight()/2);
	body.airFlow.setPosition(x+body.box.getWidth()/2, y+body.box.getHeight()/2 - strength*5);
	
	Game_Object fan = new Game_Object(x, y, L_MID, new Sprite("fan", 1), body);
	
	
	
	
	return fan;
}
