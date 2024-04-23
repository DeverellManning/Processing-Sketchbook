class Physics_Body extends Game_Component{
  int shape, type;
  float width, height;
  Physics_Body(int _type, int _shape, float _radius) {
    this.shape = _shape;
    this.type = _type;
    
    if (_shape == CS_CIRCLE) {
      this.width = _radius;
    } else if (_shape == CS_AABB) {
      this.width = _radius;
      this.height = _radius;
    }
  }
  Physics_Body(int _type, int _shape, float _width, float _height) {
    this.shape = _shape;
    this.type = _type;
    
    if (_shape == CS_CIRCLE) {
      this.width = _width;
    } else if (_shape == CS_AABB) {
      this.width = _width;
      this.height = _height;
    }
  }
  void update() {
    
    parent.vx *= 0.9;
    parent.vy *= 0.9;
  }
  
}
