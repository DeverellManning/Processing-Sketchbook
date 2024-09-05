enum Type {
  MUL,
  ADD
}

class Op {
  
  Type t;
  
  int eval(int a, int b) {
    switch (Type.MUL) {
    case MUL: return a*b;
    case ADD: return a+b;
    }
    return 0;
  }
}
