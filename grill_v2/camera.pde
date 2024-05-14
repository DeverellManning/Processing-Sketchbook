class Camera extends Game_Object {
  float zoom, speed;
  
  Camera(float _x, float _y) {
    super(_x, _y, L_TOP, null);
    this.zoom = 1.01;
    this.speed = 1;
  }
  void transform() {
    scale(this.zoom);
    translate(-this.x, -this.y);
  }
  void update() {
    
  }
}

class Follow_Camera extends Camera {
  Game_Object target;
  
  Follow_Camera(Game_Object _target, int _maxSpeed) {
    super(0, 0);
    target = _target;
  }
  void update() {
    x = round(target.x - hvasX);
    y = round(target.y - hvasY);
  }
}


class Drone_Camera extends Camera {
  Drone_Camera(float _x, float _y) {
    super(_x, _y);

    this.speed = 6;
  }
  void update() {
    float spd = this.speed / this.zoom;
    
    if (kb.keyDown(SHIFT)) {
      
      spd = spd * 6;
    }
    if (kb.keyDown('a') || kb.keyDown(65)) {
      this.x -= spd;
    }
    if (kb.keyDown('d') || kb.keyDown(68)) {
      this.x += spd;
    }
    if (kb.keyDown('w') || kb.keyDown(87)) {
      this.y -= spd;
    }
    if (kb.keyDown('s') || kb.keyDown(83)) {
      this.y += spd;
    }
    if (kb.keyDown(69)) { // e - zoom in
      this.zoom += log(this.zoom*10)/100;
    }
    if (kb.keyDown(81)) { // q - zoom out
      this.zoom -= log(this.zoom*10)/100;
    }
    //this.zoom = max(min(this.zoom, 5), 0.4)*/

  }
}
