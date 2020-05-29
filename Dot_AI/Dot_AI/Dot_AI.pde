population test;
dots bestDot;
PVector goal;
//moving coordinates
float x1 = 0;
float y1 = 175;
float w = 500;
float h = 15;
PVector obsSpeed = new PVector(4, 0);
boolean reachedGoal = false;
float mutationRate = 4;
float mutationPercent;


void setup(){
  size(700, 600);
  background(0);
  noStroke();
  test = new population(2000);
  goal = new PVector(width/2 , 35);
  textSize(18);
  
}

void draw(){
  background(0);
  fill(196,255,0);
  ellipse(goal.x, goal.y, 20, 20);
  
  mutationPercent = mutationRate/100;
  //obstacle
  if(reachedGoal){
    test.stepText();
  }
  
  fill(255, 60, 20);
  rect(x1, y1, w, h); 
  
  rect(0, 450, 500, 15);
  rect(200, 315, 700, 15);
  
  
  x1 = obsSpeed.x + x1;
  y1 = obsSpeed.y + y1;
  
  if(x1 + w > width || y1 + h > height || x1 < 0 ){
    obsSpeed.x = obsSpeed.x * -1;
  
  }
  
  if(test.allDotsDead()){
    x1 = 0;
    y1 = 175;
    test.calculateFitness();
    test.naturalSelection();
    test.mutate();
    
  
  }
  else{
    test.update();
    test.show();

  }
    text("Mutation Rate : " + mutationRate + " %", 25, 47);
}
  
void keyPressed(){
  if(keyCode == UP){
    mutationRate++;    
  }else if(keyCode == DOWN){
    mutationRate--;
  }
  if(mutationRate < 1){
    mutationRate = 1;
  }

}
