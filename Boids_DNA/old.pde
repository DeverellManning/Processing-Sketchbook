/*class DNA_ {
  
  
  float ax, ay;
  float cx, cy;
  float damp;
  float speed;
  
  DNA() {
    ax = random(-1,1);
    ay = random(-1,1);
    damp = random(0, 1);
    speed = random(0, 5);
    cx = random(0,2);
    cy = random(0,2);
  }
  
  DNA(DNA d) {
    ax = d.ax;
    ay = d.ay;
    damp = d.damp;
    speed = d.speed;
    cx = d.cx;
    cy = d.cy;
    
    if (random(1) > 0.8)
      for (int i=0;i<random(1,6);i++)   {
        mutate();
      }
  }
  
  void mutate() {
    switch(floor(random(0,6))) {
      case 0:ax =   (ax + random(-1,1))/2;break;
      case 1:ay =   (ax + random(-1,1))/2;break;
      case 2:damp = (damp + random(0,1))/2;break;
      case 3:speed = (speed + random(0,5))/2;break;
      case 4:cx = (cx + random(0,2))/2;break;
      case 5:cy = (cy + random(0,2))/2;break;
      case 6:break;
    }
  }
}*/
