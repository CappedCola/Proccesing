float x;
float y;
float xspeed[] = new float[100];
float yspeed[] = new float[100];
float dirX[] = new float[100];
float dirY[] = new float[100];


void setup(){
  size(900, 600);
  background(0);
  fill(255);
  stroke(255);
  frameRate(144);
  
  int j = 0;
  int p = 0;
  int h = 0;
  int n = 0;
  int b = 0;
  int v = 0;
  
  while(j < 100){
    dirX[p] = random(900);
    p = p + 1;
    j = j + 1;  
  }  
  while(h < 100){
    dirY[h] = random(600);
    h = h + 1;
    n = n + 1; 
  }
  while(b < 100){
    xspeed[v] = random(-5, 5);    
    yspeed[v] = random(-5, 5);
    b++;
    v++;
  }
}

int n = 0;
int i = 0;
int g = 0;
boolean spawn = true;
int v = 0;

void draw(){
 background(0);
 
  if(spawn == true){
    v++;
    while(i < 100){
      ellipse(dirX[g], dirY[g], 4, 4);    
      i = i + 1;  
      g = g + 1;
      
    }
  }
   if(v == 1){
    while(n < 99){
      
      dirX[n] = dirX[n] + xspeed[n];
      dirY[n] = dirY[n] + yspeed[n];
  
      
      if(dirY[n] > height){
        yspeed[n] = yspeed[n] * -1; 
      }
      else if(dirY[n] < 0){
        yspeed[n] = yspeed[n] * -1;
      }
      else if(dirX[n] > width){
        xspeed[n] = xspeed[n] * -1;
      }
      else if(dirX[n] < 0){
        xspeed[n] = xspeed[n] * -1; 
      }
      
      ellipse(dirX[n], dirY[n] , 4, 4);  
      n = n + 1;
    }
    n = 0;
  }
  spawn = false;
}
