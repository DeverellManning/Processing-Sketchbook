enum NodeType {
  MUL,
  ADD,
  CONST,
  READ,
  WRITE,
  IF,
  MORE,
  LESS
  
}


class Node {
  Node a;
  Node b;
  
  NodeType type;
  
  float value;
  
  Node () {
    
  }
  
  Node (Node _a, Node _b) {
    this();
    a = _a;
    b = _b;
  }
  
  Node(Node _a, Node _b, NodeType _t, float _v) {
    this(_a, _b);
    
    type = _t;
    value = _v;
  }
  
  float eval() {
    float av = 0;
    float bv = 0;
    
    if (a != null) {
      av = a.eval();
    }
    
    if (b != null) {
      bv = b.eval();
    }
    
    switch (type) {
      case CONST: break;
      case MUL: value = av * bv; break;
      case ADD: value = av + bv; break;
    }
    
    return value;
  }
}
