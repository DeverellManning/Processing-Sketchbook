final class Game_Class extends Default_Interface {
  
  float delta, lastmilli, nowmilli;
  int frame;
  
  Game_Class() {
    frame = 0;
  }
  void init() {
    texlib = new Texture_Library("texlib.json");
    world = new World();
    
    texlib.init();
    world.init();
  
    world.clear();
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
      stroke(245, 180, 140);
      textSize(40);
      text("You didn't make it.", 50, 150);
      textSize(18);
      text("Press L to restart.", 50, 200);
      pop();
    }
  }
  void input() {
    
  }
}
