class Game_Component extends Default_Interface {
  Game_Object parent;
  Game_Component() {
    clss = "Game_Component";
  }
  Game_Component(String _clss) {
    clss = _clss;
  }
  void setParent(Game_Object _parent) {
    this.parent = _parent;
  }
}
