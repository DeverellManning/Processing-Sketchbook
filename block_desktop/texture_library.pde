class Texture_Library extends Default_Interface {
  HashMap<String, PImage> data;
  String path;
  Texture_Library(String _path) {
    path = _path;
    data = new HashMap<String, PImage>();
  }
  void init() {
    JSONObject jLib;
    jLib = loadJSONObject(path);
    JSONArray jta = jLib.getJSONArray("textures");
    
    for (int i = 0; i < jta.size(); i++) {
        JSONObject j = jta.getJSONObject(i); 
        add(j.getString("name"), j.getString("path"));
        println(j.getString("name"), j.getString("path"));
    }
  }
  PImage get(String name) {
    return data.get(name);
  }
  int add(String name, String filename) {
    data.put(name, loadImage("textures/" + filename));
    return 0;
  }
  
}
