PGraphics mainUI;

ArrayList<ArrayList<String>> school = new ArrayList<ArrayList<String>>();
boolean mouseAction = false;

void setup(){
  size(960,540);
  mainUI = createGraphics(960,540);
  Ready();
  Reset();
  Setting();
  
}

void draw(){
  background(155);
  
  int situation=int(random(school.size()));
  
  NodeProcess(school.get(situation), situation);
  
  image(mainUI,0,0);
  delay(400);
}

void mousePressed(){
  if(!mouseAction)mouseAction = true;
}