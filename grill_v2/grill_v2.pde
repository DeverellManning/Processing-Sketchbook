import java.util.*;
import controlP5.*;
import fisica.*;

Game_Class game = new Game_Class();
World world;
Texture_Library texlib;
Keyboard kb = new Keyboard();
PFont font;

WorldBuilder wb;
ControlP5 cp5;

float mx, my, gmx, gmy, angle;
Boolean TextEnter = false;

void settings() {
  size(vasX, vasY, P2D);
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
}

void draw() {
  game.update();
  game.draw();

  wb.draw();
  
  fill(255);
  text(floor(frameRate), 50, 50);  
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
          wb.wbPlaceLine();
        } else {
          placeObject();
        }
        break;
      case RIGHT: removeObject();break;
      case CENTER: detailObject(); break;
    }
  }
      
  
}
