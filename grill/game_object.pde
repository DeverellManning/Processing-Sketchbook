class Game_Object extends Default_Interface {
  float x,y;
  float vx, vy;
  float ax, ay;
  float mass;
  int layer;
  
  boolean facing;
  
  boolean remove;
  boolean noSave;
  
  Sprite sprite;
  Physics_Body body;
  Particle_Emitter aura;
  Eblock_Controller guide;
  
  
  Game_Object() {
    super();
    x = 0;
    y = 0;
    vx = 0;
    vy = 0;
    ax = 0;
    ay = 0;
    layer = L_MID;
    mass = 40;
    facing = false;
    
    remove = false;
    noSave = false;
  }
  Game_Object(Sprite _sprite, Physics_Body _body, Particle_Emitter _aura) {
    this();
    
    sprite = _sprite;
    body = _body;
    aura = _aura;
    
    if (aura != null)
      aura.setParent(this);
      
    if (body != null)
      body.setParent(this);
      
    if (sprite != null)
      sprite.setParent(this);
    
    
  }
  Game_Object(float _x, float _y, int _layer, Sprite _sprite) {//NORM
    this();
    
    this.x = _x;
    this.y = _y;
    this.layer = _layer;
    
    if (_sprite != null && wb.addWithPhys) {
        this.body = new Physics_Body(CT_STATIC, CS_AABB, _sprite.tw*_sprite.scale, _sprite.th*_sprite.scale);
        this.body.setParent(this);
        
        body.box.setPosition(_x+body.box.getWidth()/2, _y+body.box.getHeight()/2);
    }
    this.sprite = _sprite;
    if (sprite != null)
      sprite.setParent(this);
    
  }
  Game_Object(float _x, float _y, int _layer, Sprite _sprite, Physics_Body _body) {
    this();
    
    this.x = _x;
    this.y = _y;
    this.layer = _layer;
    
    this.body = _body;
    if (body != null) {
        this.body.setParent(this);
    }
    this.aura = null;
    this.sprite = _sprite;
    this.guide = null;
    
    
    //sprite.setParent(this);
    
  }
  Game_Object(JSONObject jc) {
      this();
      
      this.x = jc.getFloat("x");
      this.y = jc.getFloat("y");
      this.vx = jc.getFloat("vx");
      this.vy = jc.getFloat("vy");
      this.mass = jc.getFloat("mass");
      this.layer = jc.getInt("layer");
      facing = jc.getBoolean("facing");


      //Retreive, Create Sprite
      JSONObject jSprite = jc.getJSONObject("sprite");
      switch(jSprite.getString("class")) {
          case "Animated_Sprite": 
            this.sprite = new Animated_Sprite(jSprite);
            break;
          case "Sprite": 
            this.sprite = new Sprite(jSprite);
            break;
      }
      this.sprite.setParent(this);
      
      //Load Body
      JSONObject jBody = jc.getJSONObject("body");
      if (jBody != null) {
          switch(jBody.getString("class")) {
            case "Physics_Body": this.body = new Physics_Body(jBody);break;
            case "Fan_Physics": this.body = new Fan_Physics(jBody);break;
            case "Portal_Physics": this.body = new Portal_Physics(jBody);break;
            case "Kabob_Physics": this.body = new Kabob_Physics(jBody);break;
          }
          this.body.setParent(this);
      }
      
      //Load Guide
      JSONObject jGuide = jc.getJSONObject("guide");
      if (jGuide != null) {
          switch(jGuide.getString("class")) {
              //case "Basic_Controller":  guide = new Basic_Controller(jGuide);break;
              case "Eblock_Controller": guide = new Eblock_Controller(jGuide);break;
              case "Enemy_AI": guide = new Enemy_AI(jGuide);break;
          }
          this.guide.setParent(this);
      }
      

      
      //load Aura
      JSONObject jAura = jc.getJSONObject("aura");
      if (jAura != null) {
          //this.aura = new Particle_Emitter(jAura);
      }
      
      
      
  }
  
  
  //Update method
  void update(int i) {
    if (body != null) {
      body.update();
      String name = "" + i;
      body.box.setName(name);
    }
    if (sprite != null) {sprite.update();}
    if (aura != null) {aura.update();}
    if (guide != null) {guide.update();}
  }
  
  //Draw Method
  void draw() {
    translate(this.x, this.y);
    if (sprite != null) {sprite.draw();}
    if (aura != null) {aura.draw();}
    if(kb.keyDown(49) && kb.keyDown(16)) {
      stroke(255);
      circle(0, 0, 4);
    }
  }
  
  void remove() {
    if (body != null)
      body.remove();
    remove = true;
    
  }
  void physics_update() {}
  float getX () {return x;}
  float getY () {return y;}
  
  
  
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setString("class", "Game_Object");
    
    j.setFloat("x", x);
    j.setFloat("y", y);
    j.setFloat("vx", vx);
    j.setFloat("vy", vy);
    j.setFloat("mass", mass);
    j.setInt("layer", layer);
    j.setBoolean("facing", facing);
    
    if (sprite != null) 
        j.setJSONObject("sprite", sprite.saveJSON());
    
    if (aura != null)
        j.setJSONObject("aura", aura.saveJSON());
        
    if (guide != null)
        j.setJSONObject("guide", guide.saveJSON());
    
    if (body != null)
        j.setJSONObject("body", body.saveJSON());
    
    return j;
  }
}
