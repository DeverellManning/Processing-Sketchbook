class base {
  int x;
  base() {
    x = 10;
  }
}

class derv extends base {
  int y;
  derv() {
    super();
    y = 20;
    x = 20;
  }
}

void checkX(base o) {
  println(o.x);
}

void checkY(derv o) {
  println(o.y);
}


class Follow {
  base target;
  int x, y;
  Follow(base _target, int _maxSpeed) {
    //super(0, 0);
    target = _target;
  }
  void update() {
    x = target.x;
    //y = target.y;
  }
}


void setup() {
  base o1 =  new base();
  derv o2 =  new derv();
  
  byte b1 = 00110000b;
  println(b1);
  
  Follow cam = new Follow(o1, 2);
  
  o1.x = 20;
   
  cam.update();
  
  //println("o1 X: " + o1.x);
  //println("Cam X:" + cam.x);
  
  
  
  
  
  
  /*
  //checkX(o2);
  //checkY(o1);  Doesn't work!
  //checkY(o2);
  base copy = o1;
  base copy2 = copy;
  base copy3 = copy2;
  base copy4 = copy3;
  copy2.x = 100;
  o1.x = 22;
  checkX(copy4);
*/
}


/* THINGS THAT WORK:

- A method can accept derived classes of it's argument's class.
      method(base_class obj) {return obj.x;}
      method(new derived_class());
- A copy of an object will change if you change the object.
- A copy of a copy of an object will mirror the original, not the first copy.


*/
