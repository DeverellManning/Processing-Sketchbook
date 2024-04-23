

//let tiger = new Tiger();
//let shawn = new Player();



Game_Class game = new Game_Class();
World world;
Texture_Library texlib;
Keyboard kb = new Keyboard();

void settings() {
  size(vasX, vasY);
  noSmooth();
}

void preload() {
  
}

void setup() {
  preload();
  //maze.generate()
  frameRate(30);
  noStroke();
  
  game.init();
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
