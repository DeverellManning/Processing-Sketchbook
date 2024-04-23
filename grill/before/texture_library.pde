class Texture_Library extends Default_Interface {
  HashMap<String, PImage> data;
  Texture_Library(String path) {
    JSONObject json;
    //json = new
    data = new HashMap<String, PImage>();
    
  }
  void init() {
    add("blue-tile", "blue-tile.png");
    add("bush", "bush.png");
    add("bush2", "bush2.png");
    add("orb", "orb.png");
    add("fire", "CampFireFinished.png");
    add("grass", "grass.png");
    add("ground", "ground.png");
    add("guy", "guy.png");
    add("steel-x", "Steel-X.png");
    add("portal", "portal.png");
    add("stone", "stone.png");
    add("enemy", "Enemy.png");
  }
  PImage get(String name) {
    return data.get(name);
  }
  int add(String name, String filename) {
    data.put(name, loadImage("textures/" + filename));
    return 0;
  }
  
}
