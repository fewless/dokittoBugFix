void Ready(){
  mainUI.beginDraw();
  mainUI.strokeWeight(3);
  mainUI.textSize(40);
  mainUI.fill(20);
  mainUI.rect(0,473,width,height);
  mainUI.fill(255);
  mainUI.text("SAN",0,505);
  mainUI.text("LOV",0,535);
  mainUI.stroke(255);
  mainUI.line(0,470,width,470);
  mainUI.line(560,0,560,470);
  mainUI.noFill();
  mainUI.stroke(50);
  mainUI.strokeWeight(10);
  mainUI.rect(5,5,548,458);
  mainUI.rect(565,5,390,458);
  mainUI.endDraw();
}

void Setting(){
  ellipseMode(CENTER);
  textAlign(CENTER);
  textSize(15);
  fill(0);
  
  PFont font = createFont("MS Gothic",20);
  textFont (font);
}

void Reset(){
  school.clear();
  ArrayList<String> classroom = new ArrayList<String>();//ノード配列に学校フェイズ追加
  ArrayList<String> club= new ArrayList<String>();
  ArrayList<String> lunchBreak = new ArrayList<String>();
  ArrayList<String> afterSchool = new ArrayList<String>();
  ArrayList<String> beforeHomeRoom = new ArrayList<String>();
  
  classroom.add("授業");
  classroom.add("少女を凝視する");
  classroom.add("0.7");
  classroom.add("授業に集中する");
  classroom.add("0.3");
  classroom.add("15");//SAN・恋回復
  classroom.add("5");//恋心減少
  school.add(classroom);

  club.clear();
  club.add("部活");
  club.add("少女に注目する");
  club.add("0.2");
  club.add("ボールに注目する");
  club.add("0.8");
  club.add("10");
  club.add("15");
  school.add(club);
  
  lunchBreak.clear();
  lunchBreak.add("昼休み");
  lunchBreak.add("少女と昼食をとる");
  lunchBreak.add("0.6");
  lunchBreak.add("一人で食べる");
  lunchBreak.add("0.4");
  lunchBreak.add("25");
  lunchBreak.add("10");
  school.add(lunchBreak);
  
  afterSchool.clear();
  afterSchool.add("放課後");
  afterSchool.add("少女を誘う");
  afterSchool.add("0.1");
  afterSchool.add("颯爽と帰る");
  afterSchool.add("0.9");
  afterSchool.add("20");
  afterSchool.add("10");
  school.add(afterSchool);
  
  beforeHomeRoom.clear();
  beforeHomeRoom.add("HR前");
  beforeHomeRoom.add("少女と話す");
  beforeHomeRoom.add("0.5");
  beforeHomeRoom.add("予習をする");
  beforeHomeRoom.add("0.5");
  beforeHomeRoom.add("10");
  beforeHomeRoom.add("10");
  school.add(beforeHomeRoom);
}

void ResetValue(){
  
}