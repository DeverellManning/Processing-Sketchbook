class particle {
  int x,y,r,g,b,s;
  particle(int _x, int _y, int _r, int _g, int _b, int state) {
    this.x = _x;
    this.y = _y;
    this.r = _r;
    this.g = _g;
    this.b = _b;
    this.s = state;
  }
}

int d = 1;  //pixelDensity()


void dpo(int bx, int by, int r, int g, int b) {
  bx=floor(bx)*4;
  by=floor(by)*-4 + vasY;
  for (int  x = 0; x < 4; x++) {
    for (int  y = 0; y < 4; y++) {
      //set( bx + x, by + y, [r,g,b,256]);
    }
  }
}

int _mX=400;

void dpg(int bx, int by, int r, int g, int b) {
  bx=floor(min(bx, 124))*4;
  by=floor(by)*-4 + vasY;
  for (int x = 0; x < 4; x++) {
    for (int y = 0; y < 4; y++) {
      int index = 4 * ((by+y) * vasX + bx+x);
      pixels[index] = r;
      pixels[index+1] = g;
      pixels[index+2] = b;
      pixels[index+3] = 256;
    }
  }
}


void dp(int bx, int by, int r, int g, int b) {
  bx=floor(min(bx, 124))*4;
  by=floor(by)*-4 + vasY;
  fill(color(r,g,b));
  rect(bx,by,4,4);
}
