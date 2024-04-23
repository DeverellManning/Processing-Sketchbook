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
    
    if (world.mc.guide.health <= 0) {
      push();
      textSize(30);
      text("You didn't make it.", 50, 150);
      textSize(16);
      text("Press L to restart.", 50, 200);
      pop();
    }
  }
  void input() {
    
  }
}
