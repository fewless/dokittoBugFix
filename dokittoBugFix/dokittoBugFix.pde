import processing.sound.*;
SoundFile soundfile;
SoundFile cheche;

PGraphics mainUI;

PImage sb;//speech bubble
import java.util.List;
int san = 100;
int love = 50;
boolean op=true;
boolean ending=false;

ArrayList<ArrayList<String>> school = new ArrayList<ArrayList<String>>();
boolean nodeAction = false;
PImage pic[]= new PImage[15];
PImage end;
PImage opening;
PImage end1;
PImage end2;

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
}

int situation=-1;

void draw() {
  background(205);
  if (op) {
    image(opening, 0, 0);
    text("click to start", 450, 450);
  } else if (san<=0) {
    ending=true;
    image(end, 0, 0);
  } else if (100<=love) {
    ending=true;
    image(end1, 0, 0);
  } else if (love<=0) {
    ending=true;
    image(end2, 0, 0);
  } else {
    tint( 255, 255);
    ellipse(0, 0, width*2.2*(count/countMax), height*2.2*(count/countMax));
    if (situation == -1)situation=int(random(school.size()));//決まってなければ乱数決定
    NodeProcess(school.get(situation), situation);
    image(mainUI, 0, 0);
    //if(nodeAction)NodeCalc();
    Meter();
    if (nextPro)pointProcess();
    delay(10);

    /*if (count >=countMax) {
      Reset();
      nodeAction=true;
    }*/
  }
}

void mousePressed() {

  if (op) {
    op=false;
    delay(200);
  } else if (ending) {
    delay(300);
    san = 100;
    love = 50;
    op=true;
    ending=false;
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