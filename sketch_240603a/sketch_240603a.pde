/*class Node {
  Node a;
  Node b;
  
  Node () {
    
  }
  
  Node (Node _a, Node _b) {
    a = _a;
    b = _b;
  }
  
  int eval() {
    return 0;
  }
}

class ConstNode extends Node {
  int value;
  
  ConstNode(int _v) {
    super();
    value = _v;
  }
  
  int eval() {
    return value;
  }
}

class AddNode extends Node {
  AddNode (Node _a, Node _b) {
    super(_a, _b);
  }
  
  int eval() {
    return a.eval() + b.eval();
  }
}

class MultiplyNode extends Node {
  MultiplyNode (Node _a, Node _b) {
    super(_a, _b);
  }
  
  int eval() {
    return a.eval() * b.eval();
  }
}*/

void setup() {
  Program a = new Program();
  
  a.instructions.add(new Node(new Node(null, null, NodeType.CONST, 3), new Node(null, null, NodeType.CONST, 0.5), NodeType.MUL, 2));
  a.instructions.add(new Node(new Node(null, null, NodeType.CONST, 3), new Node(null, null, NodeType.CONST, 2), NodeType.MUL, 2));
  
  a.update();
  
  a.getName();
  a.dumpMemory();
}
