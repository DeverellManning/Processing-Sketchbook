class World extends Default_Interface {
  ArrayList<Game_Object> obj;
  ArrayList<Camera> cams;
  
  Game_Object orb;
  Game_Object mc;
  
  color skyColor;
  
  Camera cam;
  
  float gravity;
  
  FWorld pworld;
  
  float sx, sy;
  
  boolean paused, breakLoop;
  
  int enemy_count, kabobCount;
  
  World() {
    super();
    
    pworld = new FWorld(-10000, -10000, 10000, 10000);
    
    this.obj = new ArrayList<Game_Object>();
    this.cams = new ArrayList<Camera>();

    this.skyColor = color(5, 5, 35);
    this.gravity = 850;
    
    sx = 0;
    sy = 0;
    
    breakLoop = false;
    
  }
  
  void update() {
    if (paused) {
      enemy_count = 0;
      
      pworld.step(game.delta/1000, 5);
      
      for (int i = obj.size()-1; i >= 0; i--) {
        Game_Object c = obj.get(i);
        c.update(i);
        
        if (breakLoop)
          break;
        
        if (c.guide != null && c.guide.clss == "Enemy_AI") {
          enemy_count++;
        }
        if (c.remove) {
          obj.remove(i);
        }
      }
    }
    for (int i = cams.size()-1; i >= 0; i--) {
      cams.get(i).update();
    }
    
    mx = cam.x + mouseX/cam.zoom;
    my = cam.y + mouseY/cam.zoom;
    
    float x = mouseX - hvasX;
    float y = mouseY - hvasY;
    angle = atan2(y, x);
    
    if (breakLoop) {
      breakLoop = false;
      game.delta = 1;
    }
    
  }
  void draw() {
    background(lerpColor(skyColor, color(256), map(mc.y, 1000, -6000, 0, 1)));
    
    push();
    rectMode(CENTER);
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
      Game_Object c = obj.get(i);

      if ((c.x - camX)*zoom > vasX+64 || (c.x - camX)*zoom < -64) {continue;}
      if ((c.y - camY)*zoom > vasY+64 || (c.y - camY)*zoom < -64) {continue;}
      if (c.hidden) {continue;}
      //tint(map(c.y, -6000, 1000, 256, 0));
      
      push();
      c.draw();
      pop();
    }
    
    
    if (kb.keyDown(50))
      pworld.draw();


    if (! kb.keyDown(SHIFT)) {
      fill(220,170,170,100);
      square(gmx,gmy,64);
    } else {
      fill(220,170,170,100);
      square(mx,my,64);
    }
    
    if (wb.lineReady) {
    	stroke(100, 255, 150);
    	rect(wb.x1, wb.y1, mx - wb.x1, my - wb.y1);
    }
    
    
    fill(0,0,0);
    circle(mx, my,8);
    
    pop();
    
    fill(255);
    
    if (mc != null) {
      if (kabobCount > 0)
        text("Kabobs Eaten: " + kabobCount, 10, 760);
      text("Enemies: " + enemy_count, 10, 780);
      text("Health: " + mc.guide.health + " out of 8", 10, 800);
    }
    
  }
  
  void input(int key) {
    if (key == 27) { //Escape
      world.saveJSONWorld();
    }
    
    if (key == 76) { //L = Load level 1
      world.loadJSONWorld("l1");
    }
    
    if (key == 67) { //C - Clear
      world.clear();
    }
    
    if (key == 82) { //R - Add Enemy
      //add(createEnemy(mc.x, mc.y));
    }
    if (key == 80) { //P - Pause
      paused = ! paused;
    }
    if (key == 9) { //Tab - Switch Camera
      cam = cams.get(0);
    }
  }
  
  void add(Game_Object o) {
    obj.add(o);
  }
  
  void init() {
    pworld.setGravity(0, gravity);
    
    
    mc = createMC(sx, sy);
    obj.add(mc);
    
    kabobCount = 0;
    
    cams.add(new Follow_Camera(mc, 1));
    cam = cams.get(cams.size()-1);
    //cam = cams.get(0);
  }
  
  void clear() {
    mc.remove();
    
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
    jWorld.setFloat("sx", sx);
    jWorld.setFloat("sy", sy);
    
    
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
      
    file = "levels/" + file;
    
    File f = dataFile(file);
    String filePath = f.getPath();
    boolean exist = f.isFile();
    if (! exist) {
      println("File does not exist: '" + file + "'");
      return;
    }
  
    clear();
    
    JSONObject jWorld;
    jWorld = loadJSONObject(file);
    
    //Load Settings
    gravity = jWorld.getFloat("gravity");
    skyColor = jWorld.getInt("skyColor");
    
    sx = jWorld.getFloat("sx");
    sy = jWorld.getFloat("sy");
    
    JSONArray jObj = jWorld.getJSONArray("obj");
    for (int i = 0; i < jObj.size(); i++) {
      // Get each object in the array
      JSONObject jc = jObj.getJSONObject(i); 
      obj.add(new Game_Object(jc));
    }
    
    init();
    breakLoop = true;
    
  }
}
