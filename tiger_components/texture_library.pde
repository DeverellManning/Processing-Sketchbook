class Texture_Library extends Default_Interface {
  HashMap<String, PImage> data;
  Texture_Library(String path) {
    JSONObject json;
    //json = new
    data = new HashMap<String, PImage>();
    
  }
  void init() {
    data.put("test", loadImage("bush.png"));
    data.put("bush", loadImage("bush.png"));
    data.put("bush2", loadImage("bush2.png"));
    data.put("orb", loadImage("orb.png"));
    data.put("fire", loadImage("CampFireFinished.png"));
  }
  PImage get(String name) {
    return data.get(name);
  }
  
}
