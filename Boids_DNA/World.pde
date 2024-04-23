class World {
  ArrayList<Boid> Boids;
  ArrayList<DNA> primeStock;
  
  ArrayList<Target> targets;
  
  int population;
  int year;
  int day;
  int yearLength;
  
  int maxScore;
  int avgScore;
  int yearMax;
  int deathCount;
  
  int sCount;
  
  Target t;
  
  World() {
    yearLength = 500;
    Boids = new ArrayList<Boid>();
    primeStock = new ArrayList<DNA>();
    targets = new ArrayList<Target>();
  }
  
  void init(int count) {
    sCount = count;
    //targets.clear();
    
    Boids.clear();
    for (int i=0;i<count;i++) {
      Boids.add(new Boid());
    }
    
    year = 0;
    day = 0;
    
    maxScore = -1500;
    avgScore = 0;
    //yearAvg = 0;
    yearMax = -1500;
    
  }
  
  void draw() {
    population = Boids.size();
    avgScore = 0;
    
    for (Target t : targets) {
      t.draw();
    }
    
    for (int i=Boids.size()-1;i>0;i--) {
      Boid b = Boids.get(i);
      b.draw();
      b.reward();
      
      if (b.remove) {
        Boids.remove(b);
        continue;
      }
      if (b.fitness > yearMax) yearMax = floor(b.fitness);
      avgScore += b.fitness;
      
    }
    
    avgScore /= Boids.size();
    
    fill(255);
    text("Year: " + year + " Day: " + day + ".", 10, 10);
    text("Population: " + population, 10, 20);
    text("All time maximum: " + maxScore, 10, 30);
    text("Average Score: " + avgScore, 10, 40);
    text("This Year:", 10, 50);
    text("  Max Score: " + yearMax, 10, 60);
    
    day++;
    if (day > yearLength) {
      endYear();
      startYear();
    }
    
  }
  
  
  void startYear() {
    Boids.clear();
    
    for (int i=0;i<sCount;i++) {
      Boids.add(new Boid(getRandomParent()));
    }
    
    year++;
    day=0;
    
    yearMax = -1500;
    deathCount = 0;
  }
  
  void endYear() {
    float max = 0;
    float last = Boids.get(0).fitness;
    
    DNA add = Boids.get(0).d;
    
    Collections.sort(Boids, new Comparator<Boid>() {
      @Override public int compare(Boid o1, Boid o2) {
        return floor(o2.fitness) - floor(o1.fitness);
      }
    });
    
    for (int i=0;i<min(5,Boids.size());i++) {
      Boid cb = Boids.get(i);
      if (cb != null) {
        DNA d = cb.d;
        d.score = lerp(cb.fitness, avgScore-deathCount*1.6, 0.24);
        primeStock.add(d);
      }
    }
    
    maxScore = max(maxScore, yearMax);
    println("Year: " + year + ". Year Average: " + avgScore + ", Year High Score: " + yearMax + ", deaths: " + deathCount + ". ");
    
    if (primeStock.size() > 15) {
      Collections.sort(primeStock, new Comparator<DNA>() {
        @Override public int compare(DNA o1, DNA o2) {
          return floor(o1.score) - floor(o2.score);
        }
      });
      
      //println("Prime stock: Count: " + primeStock.size() + " Scores: Low: " + primeStock.get(0).score + " High: " + primeStock.get(primeStock.size()-1).score);
      for (int i=0;i<5;i++) {
        primeStock.remove(i);
      }
      
      for (DNA d : primeStock) {
        d.score -= 1.2;
      }
      
    }
    
  }
  
  DNA getRandomParent() {
    return primeStock.get(floor(random(0, primeStock.size())));
  }
  
}
