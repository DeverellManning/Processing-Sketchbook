class World extends Default_Interface {
  ArrayList<Game_Object> obj;
  ArrayList<Camera> cams;
  
  Game_Object orb;
  Game_Object mc;
  
  color skyColor;
  
  Camera cam;
  
  float gravity;
  
  FWorld pworld;
  
  World() {
    super();
    
    pworld = new FWorld(-10000, -10000, 10000, 10000);
    
    this.obj = new ArrayList<Game_Object>();
    this.cams = new ArrayList<Camera>();

    this.skyColor = color(5, 5, 35);
    this.gravity = 0.089;
    
    
  }
  
  void update() {
    
    pworld.step(game.delta/1000);
    
    
    for (int i = obj.size()-1; i >= 0; i--) {
      obj.get(i).update();
    }
    for (int i = obj.size()-1; i >= 0; i--) {
      obj.get(i).physics_update();
    }
    for (int i = cams.size()-1; i >= 0; i--) {
      cams.get(i).update();
    }
    
    mx = cam.x + mouseX/cam.zoom;
    my = cam.y + mouseY/cam.zoom;
    
    gmx = floor(mx/64)*64;
    gmy = floor(my/64)*64;
    
  }
  void draw() {
    background(this.skyColor);
    
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
    
    pworld.draw();

    for (int i = obj.size()-1; i >= 0; i--) {
      Game_Object c = obj.get(i);

      if ((c.x - camX)*zoom > vasY || (c.x - camX)*zoom < -100) {continue;}
      if ((c.y - camY)*zoom > vasY || (c.y - camY)*zoom < -100) {continue;}
      
      push();
      c.draw();
      pop();
      }
    
    
    if (kb.keyDown(SHIFT)) {
      fill(220,170,170,100);
      square(gmx,gmy,64);
    }
    
    fill(50,200,200);
    circle(mx, my,8);
    
    pop();
    

    
  }
  
  void input(int key) {
    if (key == 27) {
      world.saveJSONWorld();
    }
    
    if (key == 76) {
      world.loadJSONWorld("t2");
    }
    
    if (key == 67) { //C - Clear
      world.clear();
    }
    
    if (key == 82) { //R - Add Enemy
      add(createEnemy(mc.x, mc.y));
    }
  }
  
  void add(Game_Object o) {
    obj.add(o);
  }
  
  void init() {
    pworld.setGravity(0, 300);
    
    
    orb = createMC(0, 0);
    mc = createMC(0, 0);
    obj.add(mc);
    
    cams.add(new Follow_Camera(mc, 1));
    cam = cams.get(cams.size()-1);
    //cam = cams.get(0);
  }
  
  void clear() {
    this.obj = new ArrayList<Game_Object>();
    this.cams = new ArrayList<Camera>();
    
    this.cams.add(new Drone_Camera(0,0));
    this.cam = this.cams.get(0);
    
    pworld.clear();
  }
  
  
  //SAVING THE WORLD
  int saveJSONWorld(String file) {
    JSONObject jWorld = new JSONObject();
    
    JSONArray jObj = new JSONArray();
    JSONArray jCams = new JSONArray();
    
    //Save Settings
    jWorld.setFloat("gravity", gravity);
    jWorld.setInt("skyColor", skyColor);
    
    
    
    //Save Objects
    for(int i=0;i<obj.size();i++) {
      Game_Object c = obj.get(i);
      if (c.noSave) {continue;}
      JSONObject jc = c.saveJSON();
      jObj.append(jc);
    }
    
    
    //Save Cameras
    for(int i=0;i<cams.size();i++) {
      Game_Object c = cams.get(i);
      JSONObject jc = new JSONObject();
      
      jc.setFloat("x", c.x);
      jc.setFloat("y", c.y);
      
      jCams.append(jc);
    }
    
    jWorld.setJSONArray("obj", jObj);
    jWorld.setJSONArray("cams", jCams);
    saveJSONObject(jWorld,"data/" + file);
    return 0;
  }
  
  int saveJSONWorld() {
    return saveJSONWorld("lastWorld.json");
  }
  
  //LOADING A WORLD
  void loadJSONWorld(String file) {
    clear();
    
    JSONObject jWorld;
    jWorld = loadJSONObject(file);
    
    //Load Settings
    gravity = jWorld.getFloat("gravity");
    skyColor = jWorld.getInt("skyColor");
    
    JSONArray jObj = jWorld.getJSONArray("obj");
    for (int i = 0; i < jObj.size(); i++) {
      // Get each object in the array
      JSONObject jc = jObj.getJSONObject(i); 
      obj.add(new Game_Object(jc));
    }
    
    init();
    
  }
}
