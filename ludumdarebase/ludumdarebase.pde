

//let tiger = new Tiger();
//let shawn = new Player();



Game_Class game = new Game_Class();
World world = new World();
Texture_Library texlib;
Keyboard kb = new Keyboard();

PImage bush, castle2, fire, orb_pic;

int _FRAME;

void settings() {
  size(vasX, vasY);
  noSmooth();
}

void preload() {
  //bush = loadImage("bush.png");
  castle2 = loadImage("Castle2.png");
  //fire = loadImage("CampFireFinished.png");
  
  //orb_pic = loadImage("orb.png");
  
}

void setup() {
  preload();
  //maze.generate()
  frameRate(30);
  noStroke();
  
  world.init();
}

void draw() {
  game.update();
  game.draw();

  fill(255);
  text(floor(frameRate), 50, 50);  
}

void keyPressed(){
  kb.input(keyCode, true);
  
  int keyIndex = -1;
  int allkeyindex = key;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  
  if (keyCode == 27) {
    world.saveJSONWorld();
  }
  
  print(key + " - " + keyCode + '\n');
}

void keyReleased(){
  kb.input(keyCode, false);
  
  print(key + " - Released." + '\n');
}
