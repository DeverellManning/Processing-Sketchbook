class Game_Component extends Default_Interface {
  Game_Object parent;
  Game_Component() {
    
  }
  void setParent(Game_Object _parent) {
    this.parent = _parent;
  }
}
