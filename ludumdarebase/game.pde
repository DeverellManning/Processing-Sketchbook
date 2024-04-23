final class Game_Class extends Default_Interface {
  
  float delta, lastmilli, nowmilli;
  int frame;
  
  Game_Class() {
    frame = 0;
  }
  void init() {
    Texture_Library texlib = new Texture_Library("text");
    world = new World();
    
    texlib.init();
    world.init();
  
    world.load("");
  }
  void update() {
    lastmilli = nowmilli;
    nowmilli = millis();
    delta = nowmilli - lastmilli;
    frame++;
    
    world.update();
    
  }
  void draw() {
    background(5, 5, 35);
    world.draw();
  }
  void input() {
    
  }
}
