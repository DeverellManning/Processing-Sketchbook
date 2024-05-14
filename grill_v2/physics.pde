class Physics_Body extends Game_Component{
  int shape, type;
  float width, height;
  Boolean support, touching;
  float friction;
  
  FBody box;   //Replace with FBody
  
  
  //Contructors
  Physics_Body() {
    this.clss = "Physics_Body";
    friction = 0.4;
  }
  Physics_Body(int _type, int _shape, float _radius) {
    this(_type, _shape, _radius, _radius);
  }
  Physics_Body(int _type, int _shape, float _width, float _height) {
    this();
    this.shape = _shape;
    this.type = _type;
    
    if (_shape == CS_CIRCLE) {
      width = _width;
      height = _width;
    } else if (_shape == CS_AABB) {
      width = _width;
      height = _height;
    }
    init();
  }
  //JSON Constructor
  Physics_Body(JSONObject j) {
    this();
    type = j.getInt("type");
    shape = j.getInt("shape");
    
    width = j.getFloat("width");
    height = j.getFloat("height");
    
    friction = j.getFloat("friction");
    init();
  }
  
  //Initiate
  void init() {
    if (type == CS_CIRCLE) {
      box = new FCircle(width);
    } else {
      box = new FBox(width, height);
    }
    
    if (type == CT_STATIC) {
      box.setStatic(true);
    }
    
    box.setFriction(friction);
    box.setRestitution(0.05);
    box.setGrabbable(false);
    world.pworld.add(box);
  }
  
  
  void setParent(Game_Object _parent) {
    super.setParent(_parent);
    box.setPosition(parent.x, parent.y);
    
    /*if (type == CT_STATIC && random(1) > map(parent.y, -3000, 1000, 0, 2)) {
      box.setStatic(false);
    }*/
  }
  
  
  void update() {
    support = false;
    touching = false;
    
    if (box != null) {
      parent.x = box.getX();
      parent.y = box.getY();
      parent.rotation = box.getRotation();
    }
    
  }
  
  void remove() {
    world.pworld.remove(box);
  }
  
  void setPosition(float x, float y) {
    box.setPosition(x, y);
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


class Fan_Physics extends Physics_Body {
  FBox airFlow;
  float strength;
  
  Fan_Physics(float _width, float _height, float _strength) {
    super(CT_STATIC, CS_AABB, _width, _height);
    strength = _strength;
    airFlow.setHeight(strength*10);
  }
  Fan_Physics(JSONObject j) {
    super(j);
    
    strength = j.getFloat("strength");
    airFlow.setHeight(strength*10);
    
  }
  void init() {
    super.init();
    clss = "Fan_Physics";
    
    airFlow = new FBox(width * 0.9, height);
    airFlow.setSensor(true);
    airFlow.setStatic(true);
    
    world.pworld.add(airFlow);
  }
  void setParent(Game_Object _parent) {
    super.setParent(_parent);
    airFlow.setPosition(parent.x, parent.y - strength*5);
  }
  
  void update() {
    super.update();
    
    ArrayList<FBody> touching = this.airFlow.getTouching();
    
    for(FBody b : touching) {
      b.addForce(0, -8000);
    }
  }
  
  void remove() {
    super.remove();
    world.pworld.remove(airFlow);
  }
  
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setFloat("strength", strength);
    return j;
  }
  
}


class Portal_Physics extends Physics_Body {
  float tx, ty;
  String tLevel;
  Portal_Physics(int _type, int _shape, float _width, float _height) {
    super(_type, _shape, _width, _height);
    
    clss = "Portal_Physics";
  }
  
  Portal_Physics(JSONObject j) {
    super(j);
    
    tx = j.getFloat("tx");
    ty = j.getFloat("tx");
    tLevel = j.getString("tLevel");
    clss = "Portal_Physics";
  }
  
  void update() {
    super.update();
    
    ArrayList<FBody> touching = this.box.getTouching();
    
    for(FBody b : touching) {
      if (tLevel == null && ! b.isStatic()) {
        b.setPosition(tx, ty);
      } else {
        if (b == world.mc.body.box) {
          world.loadJSONWorld(tLevel);
        }
      }
    }
  }
  
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setFloat("tx", tx);
    j.setFloat("ty", ty);
    j.setString("tLevel", tLevel);
    return j;
  }
}

class Kabob_Physics extends Physics_Body {
  Kabob_Physics(int _type, int _shape, float _width, float _height) {
    super(_type, _shape, _width, _height);
    clss = "Kabob_Physics";
  }
  
  Kabob_Physics(JSONObject j) {
    super(j);
    clss = "Kabob_Physics";
  }
  
  void update() {
    super.update();
      if (box.isTouchingBody(world.mc.body.box)) {
        world.mc.guide.health = min(world.mc.guide.health+6, 10);
        world.kabobCount++;
        
        parent.remove();
        
      }
  }
  
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    return j;
  }
}
