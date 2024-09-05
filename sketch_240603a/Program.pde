class Program {
  ArrayList<Node> instructions;
  
  int [] memory;
  
  String name;
  int gen;
  
  Program() {
    memory = new int [100];
    name = "test";
    gen = 0;
    
    instructions = new ArrayList<Node>();
  }
  
  Program (Program parent) {
    
  }
  
  void update() {
    float last = 0;
    
    for (int i = 0; i < instructions.size(); i++) {
      Node n = instructions.get(i);
      last = n.eval();
      
      print(i + ": " + last + '\n');
    }
  }
  
  String getName() {
    return this.name;
  }
  
  void dumpMemory() {
    for (int i : memory) {
      print(i);
    }
  }
}
