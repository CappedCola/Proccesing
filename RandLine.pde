float x;
float y;
PVector dir;

void setup(){
  size(640, 360);
  background(0);
  fill(255);
  stroke(255);
  frameRate(144);
  x = width/2;
  y = height/2;
}

void draw(){

  nextdir();
  display();

}


void nextdir(){
  float rand = random(8);
  
  // give dir direction
  if(rand < 1){
    dir = new PVector(1,0);
  }
  else if(rand > 1 && rand < 2){
    dir = new PVector(1,1);
  }
  else if(rand > 2 && rand < 3){
    dir = new PVector(0,1);
  }
  else if(rand > 3 && rand < 4){
    dir = new PVector(1,-1);
  }
  else if(rand > 4 && rand < 5){
    dir = new PVector(0,-1);
  }
  else if(rand > 5 && rand < 6){
    dir = new PVector(-1,-1);
  }
  else if(rand > 6 && rand < 7){
    dir = new PVector(-1,0);
  }
  else if(rand > 7){
    dir = new PVector(-1,1);
  }
    
  x = x + dir.x * 2;
  y = y + dir.y * 2;
  
}

void display(){

  circle(x, y, 1);


}
