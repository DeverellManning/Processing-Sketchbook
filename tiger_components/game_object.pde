class Game_Object extends Default_Interface {
  float x,y;
  float vx,vy;
  int layer;
  
  Sprite sprite;
  Physics_Body body;
  Particle_Emitter aura;
  Basic_Controller guide;
  
  
  Game_Object() {
    super();
    x = 0;
    y = 0;
    vx = 0;
    vy = 0;
    layer = L_MID;
  }
  Game_Object(Sprite _sprite, Physics_Body _body, Particle_Emitter _aura) {
    super();
    x = 0;
    y = 0;
    vx = 0;
    vy = 0;
    layer = L_MID;
    
    sprite = _sprite;
    body = _body;
    aura = _aura;
    guide = null;
    
    aura.setParent(this);
    body.setParent(this);
    sprite.setParent(this);
    
    
  }
  Game_Object(float _x, float _y, int _layer, Sprite _sprite) {
    super();
    
    this.x = _x;
    this.y = _y;
    this.vx = 0;
    this.vy = 0;
    this.layer = _layer;
    
    this.body = new Physics_Body(CT_DYNAMIC, CS_CIRCLE, 10);
    this.aura = null;
    this.sprite = _sprite;
    this.guide = null;
    
    this.body.setParent(this);
    //sprite.setParent(this);
    
  }
  void update() {
    if (sprite != null) {sprite.update();}
    if (aura != null) {aura.update();}
    if (guide != null) {guide.update();}
    
    this.x += this.vx;
    this.y += this.vy;
  }
  void draw() {
    translate(this.x, this.y);
    if (sprite != null) {sprite.draw();}
    if (aura != null) {aura.draw();}
    if(kb.keyDown(49) && kb.keyDown(16)) {
      stroke(255);
      circle(0, 0, 4);
    }
  }
  void physics_update() {
    if (body != null) {body.update();}
  }
  
  float getX () {return x;}
  float getY () {return y;}
  
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setString("class", "Game_Object");
    
    j.setFloat("x", x);
    j.setFloat("y", y);
    j.setFloat("vx", vx);
    j.setFloat("vy", vy);
    j.setInt("layer", layer);
    
    j.setJSONObject("sprite", sprite.saveJSON());
    return j;
  }
}
