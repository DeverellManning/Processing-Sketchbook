
Button bun = new Button(10, 10, 40, 40);

color bg = color(100, 80, 70);


void f() {
  bg = color(100, 200, 250);
}
  
void setup() {
  size(500, 500);
  
  //bun.onclick = f;
  
}

void draw() {
  background(bg);
  
  bun.update();
}
