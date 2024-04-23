class Entity extends Object_Base {
  float vx, vy;
  
  Entity(float _x, float _y, int _layer, Sprite _sprite) {
    super(_x, _y, _layer, _sprite);
    
    this.vx = 0;
    this.vy = 0;
    
    int radius = 10;
    
    //this.body = new Physics_Body(CT_DYNAMIC, CS_CIRCLE, radius)
  }
  void physics_update() {
    this.x += this.vx;
    this.y += this.vy;
  }
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setString("class", "Entity");
    
    j.setFloat("vx", vx);
    j.setFloat("vy", vy);
    return j;
  }
}
