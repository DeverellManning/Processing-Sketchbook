class Basic_Controller extends Game_Component {
  float speed;
  Basic_Controller() {
    speed = 3;
  }
  void update() {
    
    if (kb.keyDown(37) || kb.keyDown(65)) {
      parent.vx -= speed;
    }
    if (kb.keyDown(39) || kb.keyDown(68)) {
      parent.vx += speed;
    }
    if (kb.keyDown(38) || kb.keyDown(87)) {
      parent.vy -= speed;
    }
    if (kb.keyDown(40) || kb.keyDown(83)) {
      parent.vy += speed;
    }
    
  }
}
