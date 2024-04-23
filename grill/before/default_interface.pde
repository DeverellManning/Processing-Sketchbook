abstract class Default_Interface {
  String clss;
  
  Default_Interface() {
    clss = "Default_Interface";
    
  }
  void init() {
    
  }
  void draw() {
    
  }
  void update() {
    
  }
  void input() {
    
  }
  JSONObject saveJSON() {
    JSONObject j = new JSONObject();
    j.setString("class", clss);
    return j;
  }
}
