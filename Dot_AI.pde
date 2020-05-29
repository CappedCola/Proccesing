population test;
PVector goal;

void setup(){
  size(700, 600);
  background(0);
  noStroke();
  test = new population(1000);
  goal = new PVector(width/2 , 35);
  
}

void draw(){
  background(0);
  fill(255,40,30);
  ellipse(goal.x, goal.y, 15, 15);
  
  if(test.allDotsDead()){
    test.calculateFitness();
    //test.naturalSelection();
    //test.mutate();
    
  
  }
  else{
    test.update();
    test.show();
  }
}
