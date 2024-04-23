class Button {
 int x, y;
 int w, h;
 
 color c;
 
 //func onclick;
 
 Button (int _x, int _y, int _w, int _h) {
  this.x = _x;
  this.y = _y;
  this.w = _w;
  this.h = _h;
  
  this.c = color(100, 200, 150);
  
 }
 
 
 void update() {
   boolean down = false;
   
   if (mousePressed) {
     if (mouseX > this.x && mouseY > this.y) {
       if (mouseX < this.x + this.w && mouseY < this.y + this.h) {
         down = true;
       }
     }
   }
   
   stroke(100);
   if (down) {fill(lerpColor(this.c, 0, 0.5));}
   else {fill(this.c);}
   rect(this.x, this.y, this.w, this.h);
 }
 
};
