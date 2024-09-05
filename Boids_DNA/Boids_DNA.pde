
import java.util.*;

float vasX = 900;
float vasY = 900;

World world;
DNA pdna;

void setup() {
  size(900, 900, P2D);  
  //frameRate(30);
  noStroke();
  
  world = new World();
  
  world.targets.add(new Target(vasX/4,vasY/4*2.8+30, 200,200-30, 1.5));
  world.targets.add(new Target(vasX/4+20,vasY/4*2.8+100, 80,80, 2));
  world.targets.add(new Target(vasX/4+50,vasY/4*2.8, 200,30, 0.2));
  
  world.targets.add(new Target(vasX/4-40,vasY/4*2.8-40, 250,30, -500));
  world.targets.add(new Target(vasX/4,vasY/4*2.8+200, 200,30, -500));
  world.targets.add(new Target(vasX/4 - 40,vasY/4*2.8, 30,300, -500));
  world.targets.add(new Target(vasX/4 + 200,vasY/4*2.8+40, 30,300, -500));
  
  //world.targets.add(new Target(vasX/8*6,vasY/8,80,80, 1.9));
  //world.targets.add(new Target(vasX/8*6+100,vasY/8,80,80, -4));
  
  //world.targets.add(new Target(vasX/4*1,vasY/4*1,vasX/2,vasY/2, 0.05));
  
  world.init(270);
}

void draw() {
  background(0);
  world.draw();
}

void keyPressed() {
  println(key);
  if (key == 'b') {
    world.primeStock.get(world.primeStock.size()-1).display();
  }
}
