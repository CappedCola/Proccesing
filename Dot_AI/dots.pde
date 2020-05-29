class dots{

  PVector pos;
  PVector vel;
  PVector acc;
  brain brain;
  
  boolean dead = false;
  boolean reachedGoal = false;

  float fitness = 0;
  
  dots(){
    brain = new brain(400);
    
    pos = new PVector(width/2, height - 10);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  
  }

  void show(){
    fill(255);
    ellipse(pos.x, pos.y, 6, 6);
    
  
  }


  void move(){
    
    if(brain.directions.length > brain.step){
      acc = brain.directions[brain.step];
      brain.step++;
    }
    else{
       dead = true;
    }
    
    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
 
  }
  
  void update(){
    if(dead != true && !reachedGoal){
      move();
    }
    if(pos.x < 3|| pos.y < 3 || pos.x > width-3 || pos.y > height - 3){
      dead = true;
    }else if(dist(pos.x, pos.y , goal.x, goal.y) < 8){
      reachedGoal = true;
    
    }
    
  }
  
  void calculateFitness(){
    float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
    fitness = 1.0/(distanceToGoal * distanceToGoal);
    
  }
  
  
  void createBaby(){
    dots baby = new dots();
    baby.brain = brain.clone();
    return baby;
  
  
  }
  
  
  
  
}
