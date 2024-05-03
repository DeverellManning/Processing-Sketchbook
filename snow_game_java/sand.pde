class Sand {
  ArrayList<particle> s;
  int max;
  
  Sand(int _max) {
    this.s = new ArrayList<particle>();
    this.max = _max;
  }
  
  void reset(int genorator, float density) {
    //this.s = genorator.generate(density);
     for(int x=0;x<=gX;x++) {
      //#c5cb8e
      this.add(x,5, 174, 191, 110, 1);
      this.add(x,4, 100+CR(), 30, 20, 1);
      this.add(x,3, 80+CR(), 20, 15, 1);
      this.add(x,2, 60+CR(), 15, 15, 1);
      this.add(x,1, 40+CR(), 10, 10, 1);
    }
  }
  void update() {
    //this.s.sort(function (i1, i2){return i1.y - i2.y;});
    
    //Current Sand Array
    //ArrayList<particle> s = this.s;
    
    s.sort((e1, e2) -> {return e1.y - e2.y;});
      
    //Support
    boolean cs, ls, rs;
    
    //Current Pos
    int cx, cy;
    
    //Next Pos
    int dx=0;
    int dy=0;
    int cstate;
    
    //Loop through particles
    for(particle p : this.s) {
        //Current X and Y of particle
        cx = p.x;
        cy = p.y;
        
        if (cy < 1) { continue; }
        cstate = p.s;
        
        //Mouse Distance
        //md=dist(cx, cy, mx, my)
    
        //Case State
        switch (cstate) {
        case 0: //Sand
          //if(cy < 1) {
          //    cs=true;rs=true;ls=true;
          //} else {
          //    cs=false;ls=false;rs=false;
          //    //Check if against a wall
          //    if(cx <= 0) {
          //  ls = true;
          //    }
          //    if(cx >= gX) {
          //  rs = true;
          //    }
          //  int iix, iiy;
          //  //Loop through particles
          //    for(particle pp : this.s) {
          //      iix = pp.x;
          //      iiy = pp.y;
          //      if(iiy > cy) {break;}
          //      if(iiy < cy - 1) {continue;}
            
          //      if(iiy == cy - 1) {
          //          if (iix == cx) { //Central Support
          //            cs = true; continue;
          //          }
          //          if (iix == cx-1) { // Left Support
          //            ls = true; continue;
          //          }
          //          if (iix == cx+1) { //Right Support
          //            rs = true; continue;
          //          }
          //      }
          //      if(cs&&rs&&ls) {break;}
          //     }
          //}
          
          boolean[] sup = get_support(cx, cy);
          
          cs = sup[1];
          ls = sup[0];
          rs = sup[2];
      
          dx=0;dy=0;
          if (!cs || !ls || !rs) {  
              //Missing Total Support
              dy--;
    
              if(!ls && !rs && cs) {
                  //Neither Left nor Right support
                  if(tk) {
                    dx--;
                  } else {
                    dx++;
                  }
              } else {
                if(!ls) {dx--;}
                if(!rs) {dx++;}
              }
          }
          p.y += dy;
          p.x += dx;
      
          dp(p.x, p.y, p.r, p.y, p.x);
          continue;
        case 1: //Frozen
          //Draw
          dp(p.x, p.y, p.r, p.g, p.b);
          continue;
        }
        
      
    
    }
    
    for(int i = this.s.size()-1; i >= 0; i--) {
        cy = this.s.get(i).y;
        if(cy < 1) {this.s.remove(i);}
        if(cy > 1) {break;}
        
    }
  }
  int add(int x,int y,int r,int g,int b,int f) {
    if(x<0||x>vasX/4) {return 2;}
    if(y<0) {return 3;}
    for(particle p : this.s) {
      if (x == p.x && y == p.y) {
        return 1;
      }
    }
    if (this.s.size() > this.max) {return 4;}
    this.s.add(new particle(x,y,r,g,b,f));
    return 0;
  }
  void circle(int sx,int sy,int sz,int r,int g,int b, int state) { // z = radius
      for (int x=-sz;x<sz;x++) {
        for (int y=-sz;y<sz;y++) {
          float d = dist(sx+x,sy+y, sx, sy);
          if(d < (sz) && d > (sz - 3)) {
            this.add(sx+x,sy+y, r+CR(), g+CR(), b+CR(), state);
          }
        }
      }
    
  }
  void fill_circle(int sx,int sy,int sz,int r,int g,int b, int state) { // z = radius
      for (int x=-sz;x<sz;x++) {
        for (int y=-sz;y<sz;y++) {
          float d = dist(sx+x,sy+y, sx, sy);
          if(d < (sz)) {
            this.add(sx+x,sy+y, r+CR(), g+CR(), b+CR(), state);
          }
        }
      }
    
  }
    
  boolean[] get_support(int cx, int cy) {
    boolean[] r = new boolean[3];//[0,0,0];
    if(cy < 1) {
        //center    right     left
        r[1]=true;r[2]=true;r[0]=true;
    } else {
        r[1]=false;r[2]=false;r[0]=false;
        //Check if against a wall
        if(cx <= 0) {
          r[0] = true;
        }
        if(cx >= gX) {
          r[2] = true;
        }
        int iix, iiy;
        for(particle p : this.s) {
        
          iiy = p.y;
          if(iiy < cy - 1) {continue;}
          if(iiy > cy) {break;}
      
          if(iiy == cy - 1) {
              iix = p.x;
              if (iix == cx) { //Central Support
                  r[1] = true; continue;
              }
              if (iix == cx-1) { // Left Support
                  r[0] = true; continue;
              }
              if (iix == cx+1) { //Right Support
                  r[2] = true; continue;
              }
          }
          
          if(r[1]&&r[2]&&r[0]) {break;}
        }
    }
    return r;    
  }
}
