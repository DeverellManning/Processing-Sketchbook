class DNA extends HashMap<String, Float> {
  float score;
  
  DNA() {
    put("ax", rUnit());
    put("ay", rUnit());
    put("damp", rUnit());
    put("speed", rUnit());
    put("m1", 0.5);
    put("m2", -0.2);
    put("cx", rUnit());
    put("cy", rUnit());
    put("1a", rUnit());
    put("1x", rUnit());
    put("1y", rUnit());
    put("2a", rUnit());
    put("2x", rUnit());
    put("2y", rUnit());
    put("3a", rUnit());
    put("3x", rUnit());
    put("3y", rUnit());
  }
  
  DNA(Boolean not) {
    
  }
  
  DNA(DNA d) {
    for (Map.Entry<String, Float> me : d.entrySet()) {
        put(me.getKey(), me.getValue());
    }
    
    if (rUnit() > get("m1")) mutate(1, 0.8);
    if (rUnit() > get("m2")) mutate(0.05, 0.35);
    
    mutate(0.001, 0.1);
  }
  
  void mutate(float amt, float chance) {
    for (Map.Entry<String, Float> me : entrySet()) {
      if (random(1) > chance) {
        me.setValue(lerp(me.getValue(),rUnit(), amt));
      }
    }
  }
  
  void display() {
    println("Score: " + score);
    for (Map.Entry<String, Float> me : entrySet()) {
      println(me.getKey() + ": " + me.getValue());
    }
  }
  
}
