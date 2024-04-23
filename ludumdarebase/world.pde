class World extends Default_Interface {
  ArrayList<Object_Base> obj;
  ArrayList<Camera> cams;
  
  Orb orb;
  
  Camera cam;
  
  World() {
    super();
    
    this.obj = new ArrayList<Object_Base>();
    this.cams = new ArrayList<Camera>();

    
  }
  void init() {
    orb = new Orb();
    obj.add(orb);
    
    for (int i = 0; i<1000; i++) {
      world.obj.add(new Entity(i*50, random(0, 10)*50, 1, new Sprite("bush", 2)));
    }
    for (int i = 0; i<40; i++) {
      world.obj.add(new Entity(i*100, random(0, 10)*50, 1, new Animated_Sprite("fire", 64, 64, 2, 5)));
    }
    
    this.cams.add(new Drone_Camera(0,0));
    this.cams.add(new Follow_Camera(orb, 1));
    this.cam = this.cams.get(1);
  }
  void update() {
    for (int i = obj.size()-1; i >= 0; i--) {
      obj.get(i).update();
    }
    for (int i = obj.size()-1; i >= 0; i--) {
      obj.get(i).physics_update();
    }
    for (int i = cams.size()-1; i >= 0; i--) {
      cams.get(i).update();
    }
  }
  void draw() {

    push();
    cam.transform();

    float zoom = cam.zoom;
    float camX = cam.x;
    float camY = cam.y;
    
    stroke(C_RED);
    line(0, 0, 100, 0);
    stroke(C_BLUE);
    line(0, 0, 0, 100);
    noStroke();

    for (int i = obj.size()-1; i >= 0; i--) {
      Object_Base c = obj.get(i);

      if ((c.x - camX)*zoom > vasY || (c
    .x - camX)*zoom < -100) {continue;}
      if ((c.y - camY)*zoom > vasY || (c.y - camY)*zoom < -100) {continue;}
      push();
      c.draw();
      pop();
    }
    pop();
  }
  void add() {

  }
  int saveJSONWorld() {
    JSONObject jWorld = new JSONObject();
    
    JSONArray jObj = new JSONArray();
    JSONArray jCams = new JSONArray();
    
    for(int i=0;i<obj.size();i++) {
      Object_Base c = obj.get(i);
      JSONObject jc = c.saveJSON();
      jObj.append(jc);
    }
    
    for(int i=0;i<cams.size();i++) {
      Object_Base c = cams.get(i);
      JSONObject jc = new JSONObject();
      
      jc.setFloat("x", c.x);
      jc.setFloat("y", c.y);
      
      jObj.append(jc);
    }
    
    jWorld.setJSONArray("obj", jObj);
    jWorld.setJSONArray("cams", jCams);
    saveJSONObject(jWorld,"data/world.json");
    return 0;
  }
  void load(String file) {
    
  }
}
