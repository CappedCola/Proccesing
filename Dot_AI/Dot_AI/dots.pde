class dots{

  PVector pos;
  PVector vel;
  PVector acc;
  brain brain;
  
  boolean dead = false;
  boolean isBest = false;
  boolean reachedGoal = false;
  float fitness = 0;
  
  dots(){
    brain = new brain(450);
    
    pos = new PVector(width/2, height - 10);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  
  }

  void show(){
    if(isBest){
      ellipse(pos.x, pos.y, 9, 9);
      ellipse(pos.x, pos.y, 6, 6);
    }
    
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
    
    if(pos.x > x1 && pos.y > y1 && pos.x < x1 + w && pos.y < y1 + h){
      dead = true;
      
    }
    
    if(pos.x > 0 && pos.y > 450 && pos.x < 500 && pos.y < 465 ){
      dead = true;
    
    }
    
    if(pos.x > 200 && pos.y > 315 && pos.x < 775 && pos.y < 330 ){
      dead = true;
    
    } 
    
  }
  
  void calculateFitness(){
    if(reachedGoal){
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
      reachedGoal = true;
      
    
    }else{
    float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
    fitness = 1.0/(distanceToGoal * distanceToGoal);
    
    }
      
  }
  
  
  dots createBaby(){
    dots baby = new dots();
    baby.brain = brain.clone();
    return baby;
  
  
  }
  
  
  
  
}
