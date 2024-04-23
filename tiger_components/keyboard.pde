class Keyboard extends Default_Interface{
  
  private boolean[] state;
  
  
  Keyboard() {
    state = new boolean[200];
    for (int i = 0; i < 200; i++) {
      state[i] = false;
    }
  }
  void input(int key, boolean direction) {
    print(key + " " + direction);
    
    if (key < 200 && key >= 0) {
      state[key] = direction;
    }
  }
  
  boolean keyDown(int key) {
     return state[key];
  }
}
