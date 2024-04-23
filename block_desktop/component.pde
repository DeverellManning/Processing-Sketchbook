class Game_Component extends Default_Interface {
  Game_Object parent;
  float ox, oy;
  
  Game_Component() {
    super();
    clss = this.getClass().toString();
    ox = 0;
    oy = 0;
  }
  Game_Component(String _clss) {
    this();
    clss = _clss;
  }
  void setParent(Game_Object _parent) {
    this.parent = _parent;
  }
}
