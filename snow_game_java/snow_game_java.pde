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

Sand sand = new Sand(6000);

boolean firstPause=true;
boolean tk = false;
boolean addfrozen = true;

void setup() {
  size(500, 500);
  frameRate(20);
  //canvas.getContext('2d').willReadFrequently = true
  textAlign(CENTER, CENTER);
  noCursor();
  noStroke();
  start();
}

void start() {
    //toolbox;
    
    //sand.reset(wg_basic, s_density);
}

void draw() {

    tk=!tk;
    mx=round(mouseX*0.25);
    my=round(mouseY*-0.25 + vasY/4);


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
            sand.fill_circle(floor(mx), floor(my), brushSize, 120, 0, 0, addState);
            break;
        case 1:
            for(particle p : sand.s) {
                //Current X and Y of particle
                int cx = p.x;
                int cy = p.y;
                    
                //Mouse Distance
                float md=dist(cx, cy, mx, my);
                if (md < brushSize) {
                  p.x = DR();
                  p.y = 120;
                }
            }
            break;/*
        case "2":
            for(let i=0;i<sand.s.length;i++) {
                //Current X and Y of particle
                cx = sand.s[i].x;
                cy = sand.s[i].y;
                    
                //Mouse Distance
                md=dist(cx, cy, mx, my)
                if (md < brushSize) {
                  sand.s.splice(i, 1)
                }
            }
            break;
        case "3":
            for(let i=0;i<sand.s.length;i++) {
                //Current X and Y of particle
                cx = sand.s[i].x;
                cy = sand.s[i].y;
                    
                //Mouse Distance
                md=dist(cx, cy, mx, my)
                if (md < brushSize) {
                  sand.s[i].s = 0;
                  //sand.s[i].y = 120;
                }
            }
            break;*/
        }
    }
  
  background(200);
  
  if (doRender) {
    //loadPixels();
    sand.update();
    dp(mx, my, 0, 0, 0);
    //updatePixels();
  }

  push();
  drawUI();
  pop();
  

  
  
}

void drawUI() {
      textAlign(LEFT, CENTER);
      text(mx + "," + my, 400, 10);
      text(tc, 20, 10);
      text(frameRate, 100, 10);
      text(sand.s.size(), 200, 10);
      noStroke();
      fill(128, 128, 200, 120);
      //circle(mouseX, mouseY, s_bsize*8);
}

void keyPressed() {
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
    sand.update();
    //print(sand.s.length);
  }
  if (keyCode == 8) {
    //mana.killall();
  }
  if (keyCode == 13) {
      start();
  }
  if (keyCode == 67) {
      //capture("capture-" + tc);
  }
}

void mouseClicked() {
  print("clk: " + mx + ", " + my);
  //print(keyCode)
  
}

/*
function capture(name) {
  let tmpx = cam.x;
  let tmpy = cam.y;
  let tmpz = cam.z;
  
  //resizeCanvas(200*5, 75*5)
  
  //cam.x=0;cam.y=0;
  //cam.z=0.125
  
  capturemode = true;
  draw()
  saveCanvas(name)
  resizeCanvas(vasX, vasY)
  capturemode = false;
  
  //cam.x = tmpx;
  //cam.y = tmpy;
 // c/am.z = tmpz;
  
}*/
