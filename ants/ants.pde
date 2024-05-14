//Canvas Sizes
int vasX = 500;
int  vasY = 500;

//Grid Space
float  gX = vasX/4;
float  gY = vasY/4;

float ltime, ctime, delta;
float tc=0;

boolean paused = true;
boolean doRender = true;
boolean playmode = false;
boolean capturemode = false;
int renderMode = 0;

float amx, amy;
int mx, my;

int s_density = 400;
int s_bsize = 5;

int gw = 15;

Keyboard kb = new Keyboard();
DroneCamera cam = new DroneCamera(0, 0);

Plane pln = new Plane(6000);

void setup() {
  size(500, 500);
  frameRate(20);
  
  textAlign(CENTER, CENTER);
  //noCursor();
  noStroke();
  start();
}

void start() {
    pln.reset();
}

void draw() {
    mx=round(mouseX);
    my=round(mouseY);

    if(mousePressed && mouseX < vasX && mouseY < vasY && mouseX > 0 && mouseY > 0) {
        //action=document.getElementById("Action").value
        //brushSize = document.querySelector("#inBrushSize").value
        
        int action = 0;
        
        
        int brushSize = 6;
        
        
        switch(action) {
        case 0:
            //addState = document.getElementById("inState").value;
            //addColor = hexToRgb(document.getElementById("inColor").value);
            int addState = 0;
            if (key == 'a') {addState = 1;}
            color addColor = color(120,0,0);
            
            break;
        }
        
        
    }
    
  if (doRender) {
    pln.update();
  }
  
  cam.update();
  
  
  
  background(10);
  
  push();
  cam.transform();
  pln.draw();
  pop();


  push();
  drawUI();
  pop();
}

void drawUI() {
      textAlign(LEFT, CENTER);
      text(mx + "," + my, 400, 10);
      text(tc, 20, 10);
      text(frameRate, 100, 10);
      text(pln.ants.size(), 200, 10);
      noStroke();
      fill(128, 128, 200, 120);
      //circle(mouseX, mouseY, s_bsize*8);
}

void keyPressed() {
  kb.input(keyCode, true);
  //console.log(keyCode);
  if (keyCode == 49) {
    //playmode = !playmode;
    //console.log(playmode, "playing")
  }
  if (keyCode == 80) {
    paused = !paused;
    print(paused);
  }
  if (keyCode == 48) {
    doRender = !doRender;
    print(doRender);
  }
  if (keyCode == 32) {
    //sand.update();
    //print(sand.s.length);
  }
  if (keyCode == 8) {
    //pln.killall();
  }
  if (keyCode == 13) {
      start();
  }
  if (keyCode == 67) {
      //capture("capture-" + tc);
  }
}

void keyReleased(){
  kb.input(keyCode, false);
}

void mouseClicked() {
  print("clk: " + mx + ", " + my);
  //print(keyCode)
  
}
