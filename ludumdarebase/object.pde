class Object_Base extends Default_Interface {
  float x,y;
  int layer;
  Sprite sprite;
  
  Object_Base(float _x, float _y, int _layer, Sprite _sprite) {
    super();
    
    this.x = _x;
    this.y = _y;
    this.layer = _layer;
    
    this.sprite = _sprite;
    
  }
  void draw() {
    translate(this.x, this.y);
    this.sprite.draw();
    /*if(keyIsDown(49) && keyIsDown(16)) {
      stroke("#FF0000AA");
      circle(0, 0, 4);
    }*/
  }
  void physics_update() {}
  
  float getX () {return x;}
  float getY () {return y;}
  
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setString("class", "Object_Base");
    
    j.setFloat("x", x);
    j.setFloat("y", y);
    j.setInt("layer", layer);
    
    j.setJSONObject("sprite", sprite.saveJSON());
    return j;
  }
}
