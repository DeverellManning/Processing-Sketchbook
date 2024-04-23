class Sprite extends Default_Interface {
  
  //PImage texture;
  String texture;
  float scale;
  int w, h;
  int frameCount, cframe;
  int tw,th;
  
  Sprite(String _texture, float _scale) {
    super();
    
    this.texture = _texture;
    this.scale = _scale;
    
    this.frameCount = 1;
    this.cframe = 0;
    
    println(texlib.get(texture));
    this.w = texlib.get(texture).width;
    this.h = texlib.get(texture).height;
    
    this.tw=1;
    this.th=1;
    //this.w = 64;
    //this.h = 64;
    
    //console.log(this.w, this.h)
  }
  void draw() {
    if(kb.keyDown(49) && kb.keyDown(16)) { //Shift + 1
      push();
      fill(C_YELLOW);
      rect(0,0,this.w*this.scale, this.h*this.scale);
      pop();
    } else {
    image(  texlib.get(texture), 0, 0,               //Destination x & y
        this.w*this.scale, this.h*this.scale);      //Destination width & height
    }
  }
  JSONObject saveJSON() {
    JSONObject j = super.saveJSON();
    j.setString("texture", "tbd");
    j.setInt("w", w);
    j.setInt("h", h);
    j.setInt("tw", tw);
    j.setInt("th", th);
    return j;
  }
}
