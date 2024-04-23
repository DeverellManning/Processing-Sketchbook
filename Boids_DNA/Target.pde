class Target {
 float x, y, w, h;
 float reward;
 
 Target(float _x, float _y, float _w, float _h) {
   x=_x;y=_y;w=_w;h=_h;
   reward = 0.9;
 }
  Target(float _x, float _y, float _w, float _h, float _r) {
   this(_x, _y, _w, _h);
   reward = _r;
 }
 void draw() {
   if (reward > 0.1) {
     fill(10, 250, 45, 120);
   } else if (reward < -0.1) {
     fill(250, 50, 0, 120);
   } else {
     return;
   }
   rect(x, y, w, h);
 }
 float calcSuccess(float bx, float by) {
   if (bx > x && by > y && bx < x + w && by < y + h) {
     return reward;
   }
   return 0;
 }
}
