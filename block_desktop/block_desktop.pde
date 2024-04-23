import java.util.*;
import java.awt.Robot;
import java.awt.event.*;
//import java.awt.List;

import controlP5.*;
import fisica.*;

Game_Class game = new Game_Class();
World world;
Texture_Library texlib;
Keyboard kb = new Keyboard();
PFont font;
Robot robot;

WorldBuilder wb;
ControlP5 cp5;

float mx, my, gmx, gmy, angle;
Boolean TextEnter = false;

void settings() {
  size(vasX, vasY, P2D);
  //fullcreen(P2D);
  noSmooth();
}

void setup() {
  frameRate(30);
  noStroke();
  //hint(NO_SMOOTH);
  
  font = loadFont("GoSmallcaps-12.vlw");
  Fisica.init(this);
  cp5 = new ControlP5(this);
  game.init();
  wb = new WorldBuilder();
  
  try { 
    robot = new Robot();
    robot.setAutoDelay(0);
  } 
  catch (Exception e) {
    e.printStackTrace();
  }
}

void draw() {
   
  game.update();
  game.draw();

  //wb.draw();
  
  fill(255);
  text(floor(frameRate), 50, 50); 
  mouseMove(displayWidth/2, displayHeight/2);
  
}
 
void keyPressed(){
  List<Textfield> list = cp5.getAll(Textfield.class);
  for(Textfield t:list) {
    if (t.isActive()) 
      return;
  }
  
  kb.input(keyCode, true);
  world.input(keyCode);
}

void keyReleased(){
  kb.input(keyCode, false);
}

void mouseClicked() {
  
  if (mouseX > 800) {
    
  } else {
    switch (mouseButton) {
      case LEFT: 
        if (kb.keyDown(17)) {
          //wb.wbPlaceLine();=mouseX
        } else {
          placeObject();
        }
        break;
      case RIGHT: removeObject();break;
      case CENTER: detailObject(); break;
    }
  }
      
  
}

void mouseMove(int x, int y) {
  robot.mouseMove(x, y);
}

/*Point getGlobalMouseLocation() {
  // java.awt.MouseInfo
  PointerInfo pointerInfo = MouseInfo.getPointerInfo();
  Point p = pointerInfo.getLocation();
  return p;  
}*/
