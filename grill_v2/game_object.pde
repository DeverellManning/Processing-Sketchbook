class Game_Object extends Default_Interface {
  float x,y;
  float vx, vy;
  float w, h;
  float mass;
  float rotation;
  int layer;
  int facing;

  private boolean remove;
  boolean noSave;
  boolean hidden;

  //Components
  Sprite sprite;
  Physics_Body body;
  Particle_Emitter aura;
  Eblock_Controller guide;


  Game_Object() {
    super();
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    vx = 0;
    vy = 0;
    layer = L_MID;
    facing = D_LEFT;

    remove = false;
    noSave = false;
  }
  Game_Object(Sprite _sprite, Physics_Body _body, Particle_Emitter _aura) {
    this();

    sprite = _sprite;
    body = _body;
    aura = _aura;

    setup();
  }

  Game_Object(float _x, float _y, int _layer, Sprite _sprite) {//NORM
    this();

    x = _x;
    y = _y;
    layer = _layer;

    sprite = _sprite;

    if (_sprite != null && wb.addWithPhys) { // Problem Line
        this.body = new Physics_Body(CT_STATIC, CS_AABB, _sprite.tw*_sprite.scale, _sprite.th*_sprite.scale);
        this.body.setParent(this);

        body.box.setPosition(_x+body.width/2, _y+body.height/2);
    }

    setup();

  }
  Game_Object(float _x, float _y, int _layer, Sprite _sprite, Physics_Body _body) {
    this();

    this.x = _x;
    this.y = _y;
    this.layer = _layer;

    this.body = _body;
    this.aura = null;
    this.sprite = _sprite;
    this.guide = null;


    setup();

  }
  Game_Object(JSONObject jc) {
      this();

      x = jc.getFloat("x");
      y = jc.getFloat("y");
      vx = jc.getFloat("vx");
      vy = jc.getFloat("vy");
      //this.mass = jc.getFloat("mass");
      layer = jc.getInt("layer");
      facing = jc.getInt("facing");


      //Retreive, Create Sprite
      JSONObject jSprite = jc.getJSONObject("sprite");
      if (jSprite != null) {
        switch(jSprite.getString("class")) {
            case "Animated_Sprite": sprite = new Animated_Sprite(jSprite);break;
            case "Sprite": 									sprite = new Sprite(jSprite); break;
        }
      }

      //Load Body
      JSONObject jBody = jc.getJSONObject("body");
      if (jBody != null) {
          switch(jBody.getString("class")) {
            case "Physics_Body":    body = new Physics_Body(jBody);break;
            case "Fan_Physics":     body = new Fan_Physics(jBody);break;
            case "Portal_Physics":  body = new Portal_Physics(jBody);break;
            case "Kabob_Physics":   body = new Kabob_Physics(jBody);break;
          }
      }

      //Load Guide
      JSONObject jGuide = jc.getJSONObject("guide");
      if (jGuide != null) {
          switch(jGuide.getString("class")) {
              //case "Basic_Controller":  guide = new Basic_Controller(jGuide);break;
              case "Eblock_Controller": guide = new Eblock_Controller(jGuide);break;
              case "Enemy_AI": 									guide = new Enemy_AI(jGuide);break;
          }
      }



      //load Aura
      JSONObject jAura = jc.getJSONObject("aura");
      if (jAura != null) {
          //aura = new Particle_Emitter(jAura);
      }


      setup();

  }

  //After Contructor setup
  void setup() {
    if (sprite != null) {
      sprite.setParent(this);
    }
    if (body != null) {
      body.setParent(this);
    }
    if (guide != null) {
      guide.setParent(this);
    }
    if (aura != null) {
      aura.setParent(this);
    }

  }


  //Update method
  void update(int i) {
    if (body != null) {
      body.update();
      body.box.setName("" + i);
    }
    if (sprite != null) {sprite.update();}
    if (aura != null) {aura.update();}
    if (guide != null) {guide.update();}
  }

  //Draw Method
  void draw() {
    translate(x, y);
    rotate(rotation);
    if (sprite != null) {sprite.draw();}
    if (aura != null) {aura.draw();}
    if(kb.keyDown(49) && kb.keyDown(16)) {
      stroke(255);
      circle(0, 0, 4);
    }
  }


  void remove() {
    if (body != null) body.remove();
    remove = true;
  }

  float getX () {return x;}
  float getY () {return y;}

  void setPosition(float x, float y) {
    body.setPosition(x, y);
  }



  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setString("class", "Game_Object");

    j.setFloat("x", x);
    j.setFloat("y", y);
    j.setFloat("vx", vx);
    j.setFloat("vy", vy);
    j.setFloat("w", x);
    j.setFloat("h", y);
    j.setFloat("mass", mass);
    j.setFloat("rotation", mass);
    j.setInt("layer", layer);
    j.setInt("facing", facing);
    j.setBoolean("hidden", hidden);

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
