float fRate;
float untilRed;
float x;
float y;

void setup(){
  size(800, 600);
  background(0);
  fRate = 15;
  frameRate(fRate);
  untilRed = 0;
  stroke(255);
  strokeWeight(3);
  x = random(width);
  y = random(height);
}

  
void draw(){  
  float px = x;
  float py = y;
  x = random(width);
  y = random(height);
  line(x, y, px, py);
  circle(x ,y ,2);
  
  
  frameRate(fRate);
  fRate = fRate * 1.02;
  
  untilRed = untilRed +1;
  if(untilRed == 3000){
    stroke(255, 25, 100);
    fRate = 15;
  }
}
