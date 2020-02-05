void Meter(){
  noStroke();
  fill(200);
  rect(80,507,(width-80)*(love/100.0) + random(-1,1),35);
  
  fill(150);
  rect(80,472,(width-80)*(san/100.0) + random(-1,1),35);
  
  
}

boolean check=false;
int che=0;
int chea=0;
int cheMax=20;

void Check(int x,int y){
  fill(150);
  strokeWeight(30);
  stroke(40);
  int sca = 50;
  float dodo = (float)che/(cheMax/2);
  float dodoa = (float)chea/(cheMax/2);
  if(che<10){
    line(x-sca,y-sca,x-sca*(1-dodo),y-sca*(1-dodo));
    
  }else{
     line(x-sca,y-sca,x,y);
    line(x,y,x+sca*2.5*dodoa,y-sca*2.5*dodoa);
   }
   
   if(che<10)che++;
   else chea++;
   
   if(chea >9){
    
    che=0;
    chea=0;
    check=false;
   }
  strokeWeight(3);
}

int movePoint=0;
int sanR=0;
int loveR=0;

void pointProcess(){
  
  if(movePoint==0){
    sanR=int(random(-20,20));
    loveR=int(random(-20,20));
  }
  fill(20,255-movePoint*2);
  textSize(40);
  pushMatrix();
  translate(750,400 - movePoint);
  rotate(sanR*PI/50);
  if(sanP!=0)text("SAN+"+sanP,0,0);
  popMatrix();
  pushMatrix();
  translate(750,500 - movePoint);
  rotate(loveR*PI/50);
  if(sanP!=0)text("LOV+"+loveP,0,0);
  else text("LOV-"+loveP,0,0);
  popMatrix();
  movePoint++;
  textSize(15);
  noFill();
}