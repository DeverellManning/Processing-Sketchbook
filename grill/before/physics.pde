class Physics_Body extends Game_Component{
  int shape, type;
  float width, height;
  Boolean support, touching;
  float friction;
  
  FBox box;
  
  Physics_Body() {
    this.clss = "Physics_Body";
    friction = 0.5;
  }
  Physics_Body(int _type, int _shape, float _radius) {
    this(_type, _shape, _radius, _radius);
  }
  Physics_Body(int _type, int _shape, float _width, float _height) {
    this();
    this.shape = _shape;
    this.type = _type;
    
    if (_shape == CS_CIRCLE) {
      this.width = _width;
    } else if (_shape == CS_AABB) {
      this.width = _width;
      this.height = _height;
    }
    
    box = new FBox(_width, _height);
    
    if (_type == CT_STATIC) {
      box.setStatic(true);
    }
    
    box.setFriction(.2);
    box.setRestitution(0.2);
    world.pworld.add(box);
    
  }
  Physics_Body(JSONObject j) {
    this();
    type = j.getInt("type");
    shape = j.getInt("shape");
    
    width = j.getFloat("width");
    height = j.getFloat("height");
    
    friction = j.getFloat("friction");
    
    box = new FBox(width, height);
    box.setFriction(.2);
    world.pworld.add(box);
    
    
  }
  
  void update() {
    support = false;
    touching = false;
    
    float x = parent.x;
    float y = parent.y;
    
    if (box != null) {
      parent.x = box.getX() - box.getWidth()/2;
      parent.y = box.getY() - box.getHeight()/2;
    }
    
  }
  
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setInt("shape", shape);
    j.setInt("type", type);
    j.setFloat("width", width);
    j.setFloat("height", height);
    j.setFloat("friction", friction);
    return j;
  }
}
