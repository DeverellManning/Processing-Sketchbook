/*class Orb extends Entity {
  int spd = 4;
  
  int[][] trail;
  Orb() {
    super(0, 0, L_MID, new Animated_Sprite("orb", 64, 64, 1, 6));
    
    trail=new int[7][2];
  }
  void update() {
    trail[0][0] = floor(x);
    trail[0][1] = floor(y);
    for (int i = 6; i>0; i--) {
      trail[i][0] = trail[i-1][0];
      trail[i][1] = trail[i-1][1];
    }
    
    if (kb.keyDown(37) || kb.keyDown(65)) {
      this.vx -= spd;
    }
    if (kb.keyDown(39) || kb.keyDown(68)) {
      this.vx += spd;
    }
    if (kb.keyDown(38) || kb.keyDown(87)) {
      this.vy -= spd;
    }
    if (kb.keyDown(40) || kb.keyDown(83)) {
      this.vy += spd;
    }
    
    this.vx *= 0.9;
    this.vy *= 0.9;
  }
  
  void draw() {
    
    for (int i = 6; i>0; i--) {
      circle(trail[i][0] + 32, trail[i][1] + 32, 8*(7-i)+random(8,10));
    }
    
    super.draw();
  }
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setString("class", "Orb");
    
    return j;
  }
}*/


Game_Object createOrb() {
  Game_Object orb = new Game_Object(new Animated_Sprite("orb", 64, 64, 1, 6),
                            new Physics_Body(CT_DYNAMIC, CS_AABB, 64, 64),
                            new Particle_Emitter()
                           );
  orb.guide = new Basic_Controller();
  orb.guide.setParent(orb);
  return orb;
  
}
