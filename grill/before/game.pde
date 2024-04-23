final class Game_Class extends Default_Interface {
  
  float delta, lastmilli, nowmilli;
  int frame;
  
  Game_Class() {
    frame = 0;
  }
  void init() {
    texlib = new Texture_Library("text");
    world = new World();
    
    texlib.init();
    world.init();
  
    //world.load("");
  }
  void update() {
    lastmilli = nowmilli;
    nowmilli = millis();
    delta = nowmilli - lastmilli;
    frame++;
    
    world.update();
    
  }
  void draw() {
    world.draw();
  }
  void input() {
    
  }
}
