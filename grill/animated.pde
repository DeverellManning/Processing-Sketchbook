class Animated_Sprite extends Sprite {
  Animated_Sprite(String _texture, int _width, int _height, float _scale, int _frameCount) {
    super(_texture, _scale);
    clss = "Animated_Sprite";
    
    this.frameCount = _frameCount;
    this.cframe = ceil(random(_frameCount));
    
    this.tw = _width;
    this.th = _height;
    
  }
  Animated_Sprite(JSONObject jSprite) {
    super(jSprite);
    clss = "Animated_Sprite";
    
    this.w = jSprite.getInt("w");
    this.h = jSprite.getInt("h");
    
    this.frameCount = jSprite.getInt("frameCount");
    this.cframe = ceil(random(frameCount));
    this.tw = 64;
    this.th = 64;
    
  }
  void draw() {
    if(game.frame%4 == 0) {
      cframe=cframe%frameCount+1;
      //print(cframe);
    }
    if(kb.keyDown(49) && kb.keyDown(16)) {
      rect(0,0,64*this.tw, 64*this.th);
    } else {
    image(texlib.get(texture), 0f, 0f,               //Destination x & y
        this.tw*this.scale, this.th*this.scale,    //Destination width & height
        this.cframe*64, 0,             //Source x & y
        (this.cframe-1)*64, 64);                //Source width & height
    }
  }
}
