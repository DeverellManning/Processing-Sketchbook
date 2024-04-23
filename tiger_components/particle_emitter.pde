class Particle_Emitter extends Game_Component {
  int spd = 4;
  int[][] trail;
  
  Particle_Emitter() {
    super();
    
    trail=new int[7][2];
  }
  void update() {
    trail[0][0] = floor(parent.x);
    trail[0][1] = floor(parent.y);
    for (int i = 6; i>0; i--) {
      trail[i][0] = trail[i-1][0];
      trail[i][1] = trail[i-1][1];
    }
  }
  
  void draw() {
    for (int i = 6; i>0; i--) {
      circle(trail[i][0] + 32 - parent.x, trail[i][1] + 32 - parent.y, 8*(7-i)+random(8,10));
    }
  }
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setString("class", "Particle_Emitter");
    return j;
  }
}
