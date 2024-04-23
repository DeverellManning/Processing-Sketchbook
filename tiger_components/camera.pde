class Camera extends Game_Object {
  float zoom, speed;
  
  Camera(float _x, float _y) {
    super(_x, _y, L_TOP, null);
    this.zoom = 1;
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
    x = target.x - vasX/2;
    y = target.y - vasY/2;
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




/*
let cam = {
  transform() {
    scale(this.z)
    translate(-this.x, -this.y);
  },
  update() {
    if (!playmode) {
      let spd = this.s / this.z;
    if (keyIsDown(SHIFT)) {
      spd = spd * 3;
    }
    if (keyIsDown(LEFT_ARROW) || keyIsDown(65)) {
      this.x -= spd;
    }
    if (keyIsDown(RIGHT_ARROW) || keyIsDown(68)) {
      this.x += spd;
    }
    if (keyIsDown(UP_ARROW) || keyIsDown(87)) {this.y -= spd;}
    if (keyIsDown(DOWN_ARROW) || keyIsDown(83)) {this.y += spd;}
    if (keyIsDown(69)) { // e - zoom in
      this.z += log(this.z*10)/100;
    }
    if (keyIsDown(81)) { // q - zoom out
      this.z -= log(this.z*10)/100;
    }
    this.z = max(min(cam.z, 5), 0.4)
    } else {
      this.x = (xe.x-2)*gs;
      this.y = (xe.y-2)*gs;
      this.z = 2
    }
  }
}*/
