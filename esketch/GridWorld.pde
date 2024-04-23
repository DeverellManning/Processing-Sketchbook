class GridWorld {
  int[][][] gr;
  
  GridWorld() {
    gr = new int[GW][GH][GW];
    
    for (int y = 0; y < GH; y++) {
      for (int x = 0; x < GW; x++) {
        for (int z = 0; z < GW; z++) {
          gr[x][y][z] = 0;
          if (y < 5) {
            gr[x][y][z] = tDirt;
          }
          ///g[x][y][z] = t;
        }
      }
    }
    
  }
  
  void draw() {
    
    for (int y = 0; y < GH; y++) {
      for (int x = 0; x < GW; x++) {
        for (int z = 0; z < GW; z++) {
          println(x, ", ", y, ", ", z);
          if (gr[x][y][z] == tAir) {
            continue;
          }
          push();
          translate(x*GS, y*GS, z*GS);
          fill(160);
          box(40);
          pop();
        }
      }
    }
    
  }
}
