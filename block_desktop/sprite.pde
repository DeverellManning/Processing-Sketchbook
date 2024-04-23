class Sprite extends Game_Component {
  String texture;
  float scale;
  int w, h;
  int frameCount, cframe;
  int tw,th;
  
  Sprite(String _texture, float _scale) {
    super("Sprite");
    
    this.texture = _texture;
    this.scale = _scale;
    
    this.frameCount = 1;
    this.cframe = 0;
    
    //println(texlib);
    //println(texlib.get(texture));
    this.w = texlib.get(texture).width;
    this.h = texlib.get(texture).height;
    
    this.tw=w;
    this.th=h;
    //this.w = 64;
    //this.h = 64;
  }
  Sprite(JSONObject jSprite) {
    super("Sprite");
    
    this.texture = jSprite.getString("texture");
    this.scale = jSprite.getFloat("scale");
    
    this.w = jSprite.getInt("w");
    this.h = jSprite.getInt("h");
    
    this.tw = jSprite.getInt("tw");
    this.th = jSprite.getInt("th");
    
  }
  void draw() {
      
    if(kb.keyDown(49) && kb.keyDown(16)) { //Shift + 1
      push();
      fill(C_YELLOW);
      rect(0,0,this.tw*this.scale, this.th*this.scale);
      pop();
    } else {
        if(parent.facing == D_LEFT) {
            image(  texlib.get(texture), this.w*this.scale*-0.5, this.h*this.scale*-0.5, this.w*this.scale, this.h*this.scale,
                    floor(this.w), 0, 0, floor(this.h));
        } else {
            image(  texlib.get(texture), this.w*this.scale*-0.5, this.h*this.scale*-0.5, this.w*this.scale, this.h*this.scale,
                    0, 0, floor(this.w), floor(this.h));
        }
        
        if (parent.guide != null && parent.guide.redTimer >= 0) {
            fill(255, 32, 21, map(parent.guide.redTimer, 0, 5, 100, 230));
            rect(0,0, this.w*this.scale, this.h*this.scale);
        }
    }
  }
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setString("texture", texture);
    j.setInt("w", w);
    j.setInt("h", h);
    j.setInt("tw", tw);
    j.setInt("th", th);
    j.setFloat("scale", scale);
    j.setInt("frameCount", frameCount);
    return j;
  }
}
