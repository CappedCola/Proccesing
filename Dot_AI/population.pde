class population {
  dots[] dots;
  float fitnessSum;

  population(int size) {
    dots = new dots[size];
    for (int i = 0; i < size; i++) {
      dots[i] = new dots();
    }
  }


  void show() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].show();
    }
  }


  void update() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].update();
    }
  }
  
  void calculateFitness(){
    for(int i = 0; i < dots.length; i++){
      dots[i].calculateFitness();
    
    }
  
  
  }
  
  
  boolean allDotsDead(){
    for(int i = 0; i < dots.length; i++){
      if(dots[i].dead == false && dots[i].reachedGoal != true){
        return false;
        
      }
      
    }
    return true;
  
  }
  void naturalSelection(){
    dots[] newDots = new dots[dots.length];
  
    for(int i = 0; i < newDots.length; i++){
      dots parent = selectParent();
      
      newDots[i] = parent.createBaby();
    
    }
  
  }
  
  
  void calculateFitnessSum(){
    fitnessSum = 0;
    for(int i = 0; i < dots.length; i++){
      fitnessSum += dots[i].fitness;
    
    }
  
  }
  
  
  dots selectParent(){
    float rand = random(fitnessSum);
    
    float runningSum = 0;
  
    for(int i = 0; i < dots.length; i++){
      runningSum += dots[i].fitness;
      if(runningSum > rand){
        return dots[i];
      }    
    }
    return null;
  }
}
