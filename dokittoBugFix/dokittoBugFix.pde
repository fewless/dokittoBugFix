 import processing.sound.*;
SoundFile soundfile;
SoundFile cheche;

PGraphics mainUI;

PImage sb;//speech bubble
import java.util.List;
float gMax =80;
int san = 80;
int love = 40;
boolean op=true;
boolean ending=false;

ArrayList<ArrayList<String>> school = new ArrayList<ArrayList<String>>();
boolean nodeAction = false;
PImage pic[]= new PImage[15];
PImage opening,op1,op2;
PImage end,end1,end2;

void setup() {
  soundfile = new SoundFile(this, "ino.mp3");
  cheche = new SoundFile(this, "check.mp3");
  soundfile.loop();
  size(960, 540);
  fill(20);
  mainUI = createGraphics(960, 540);

  Ready();
  Reset();
  Setting();

  sb = loadImage("per.png");

  for (int k=0; k <15; k++)//画像読み込み
    pic[k] = loadImage(k +".jpg");
  end = loadImage("end.png");
  end1 = loadImage("end1.png");
  end2 = loadImage("end2.jpg");
  opening = loadImage("title.jpg");
  op1 = loadImage("exp1.jpg");
  op2 = loadImage("exp.jpg");
}

int situation=-1;
int nextSituation = -1;
int doneOp = 0;
boolean endingIns=false;
void draw() {
  background(205);
  if (op) {
    image(opening, 0, 0);
    text("click to start", 450, 450);
  }else if(doneOp==0){//操作説明　初回のみ
    image(op1, 0, 0);
  }else if(doneOp==1){
    image(op2, 0, 0);
  } else if (san<=0) {//SAN切れEND
    ending=true;
    image(end, 0, 0);
    endingIns=true;
  } else if (gMax<=love) {//恋しちゃったEND
    ending=true;
    image(end1, 0, 0);
    endingIns=true;
  } else if (love<=0) {//正規END
    ending=true;
    image(end2, 0, 0);
    endingIns=true;
  } else {
    tint( 255, 255);
    ellipse(0, 0, width*2.2*(count/countMax), height*2.2*(count/countMax));
    if(nextSituation != -1 && !nextPro)situation = nextSituation;//次が決まっていれば引っ張ってくる
    else if (situation == -1)situation=int(random(school.size()));//決まってなければ乱数決定
    
    NodeProcess(school.get(situation), situation);
    image(mainUI, 0, 0);
    //if(nodeAction)NodeCalc();
    Meter();
    if (nextPro)pointProcess();  
    delay(10);

    if (count >=countMax) {
      Reset();
      nodeAction=true;
    }
  }
  if ((san<=0 || gMax<=love || love<=0)&& !endingIns) a = new PaperTurning(1,1);
  
  if(endingIns){
    daw -=70; 
    a.grip(1,1,daw);
    background(255);
    updatePixels(); 
  }
  
}

void mousePressed() {

  if (op) {
    initProcess();
    countN=0;
    op=false;
    delay(200);
    daw = width;
  }else if (doneOp < 2) {
    doneOp++;
    delay(200);
  } else if (ending) {
    delay(300);
    initProcess();
    san = 80;
    love = 40;
    op=true;
    ending=false;
    endingIns = false;
  } else {
    if (!nodeAction) {
      //NextNode();
      if (560<mouseX && mouseY<470) {
        Reset();
        nodeAction=true;
      }
    }
    if (!mouseOb)mouseOb=true;
  }
} 