boolean processOver = false;
ArrayList<Integer> processMemory = new ArrayList<Integer>();
ArrayList<Integer> baseNode = new ArrayList<Integer>();// x/y/phase(not used) / situation / choice /targetX/tartgetY / takeDigree(4+3points) 21
ArrayList<Integer> firstNode = new ArrayList<Integer>();// x/y/takeDigree(4+3points) 16
ArrayList<Integer> secondNode = new ArrayList<Integer>();// x/y/takeDigree(4+3points) 16

float countMax =150;
int count = int(countMax/4);
float countMaxN = countMax*1.5; //遷移用
int countN =0;
boolean nextPro=false;//遷移処理したか
int xC=0;
int yC=0;//補正値
int angM1, angM2;

int bX=-100;//前ノードの位置
int bY=-100;
int dummy1, dummy2;
String nodesA, nodesB;
boolean mouseOb=false;
int nodeSet =0;
int sanP=0;
int loveP=0;


void NodeProcess(ArrayList<String> nodes, int situ) {//+before info

  if (!nextPro)image(pic[situ*3], 560, 0);
  else {
    image(pic[situ*3+baseNode.get(4)+1], 560, 0);
  }
  println(situ);

  if (!processOver) {//一回目は処理する

    baseNode.clear();//初期化
    firstNode.clear();
    secondNode.clear();

    nodesA = nodes.get(2);
    nodesB = nodes.get(4);
    int positionX = 120;
    int positionY = 80;

    baseNode.add(positionX);
    baseNode.add(positionY);
    baseNode.add(0);
    baseNode.add(situ);//シチュエーション記録
    baseNode.add(int(random(2)));

    int maxDig= 70;//角度最大
    int digCollect = -20;//角度補正値

    baseNode.addAll(DrawArrow(bX, bY, positionX, positionY, 50, 70, countMax));
    fill(255);
    ellipse(positionX, positionY, 40*nodes.get(0).length(), 50);
    fill(0);
    text(nodes.get(0), positionX, positionY);
    int digs=0;

    for (int i=0; i<2; i++) {
      int num = i*2 +1;
      int distance=int(random(250, 350));//ノード間の距離min max
      digs += int(random(30, digs +maxDig/2));
      if (i==0)angM1 = digs;
      else angM2 = digs;

      int newX = positionX + int(distance*cos(radians(digs + digCollect)));
      int newY = positionY + int(distance*sin(radians(digs + digCollect)));
      if (i==0)firstNode.addAll(DrawArrow(positionX, positionY, newX, newY, 50, 70, count));
      else secondNode.addAll(DrawArrow(positionX, positionY, newX, newY, 50, 70, count));

      fill(255);
      ellipse(newX, newY, 30*nodes.get(num).length(), 50);
      textSize(40);
      //text(nodes.get(num+1), (positionX+newX)/2, (positionY+newY)/2);
      fill(0);
      textSize(15);
      text(nodes.get(num), newX, newY);
    }
    processOver = true;
  } else if (!nodeAction) {//読み込んで処理
    if (count < countMax) {
      firstNode.addAll(DrawArrow(baseNode.get(0), baseNode.get(1), firstNode.get(0), firstNode.get(1), 50, 70, count));
      secondNode.addAll(DrawArrow(baseNode.get(0), baseNode.get(1), secondNode.get(0), secondNode.get(1), 50, 70, count)); 
      firstNode.subList(0, 16).clear();
      secondNode.subList(0, 16).clear();
      count++;
    }

    fill(0);
    beginShape();
    for (int k=7; k<15; k+=2)vertex(baseNode.get(k), baseNode.get(k+1));
    endShape(CLOSE);
    beginShape();
    for (int k=15; k<21; k+=2)vertex(baseNode.get(k), baseNode.get(k+1));
    endShape(CLOSE);
    beginShape();
    for (int k=2; k<10; k+=2)vertex(firstNode.get(k), firstNode.get(k+1));
    endShape(CLOSE);
    beginShape();
    for (int k=10; k<16; k+=2)vertex(firstNode.get(k), firstNode.get(k+1));
    endShape(CLOSE);
    beginShape();
    for (int k=2; k<10; k+=2)vertex(secondNode.get(k), secondNode.get(k+1));
    endShape(CLOSE);
    beginShape();
    for (int k=10; k<16; k+=2)vertex(secondNode.get(k), secondNode.get(k+1));
    endShape(CLOSE);

    fill(255);
    textSize(40);
    PerBubble(firstNode.get(0), firstNode.get(1), 50, count, int(countMax/2), angM1, nodes.get(2));
    PerBubble(secondNode.get(0), secondNode.get(1), 50, count, int(countMax/2), angM2, nodes.get(4));
    ellipse(baseNode.get(0), baseNode.get(1), 30*nodes.get(0).length(), 50);
    ellipse(firstNode.get(0), firstNode.get(1), 30*nodes.get(1).length(), 50);
    ellipse(secondNode.get(0), secondNode.get(1), 30*nodes.get(3).length(), 50);
    fill(0);
    textSize(15);
    text(nodes.get(0), baseNode.get(0), baseNode.get(1));
    text(nodes.get(1), firstNode.get(0), firstNode.get(1));
    text(nodes.get(3), secondNode.get(0), secondNode.get(1));
    textSize(40);
    fill(255);
    //text(nodes.get(2), (baseNode.get(0)+firstNode.get(0))/2, (baseNode.get(1)+firstNode.get(1))/2);
    //text(nodes.get(4), (baseNode.get(0)+secondNode.get(0))/2, (baseNode.get(1)+secondNode.get(1))/2);
    textSize(15);
    check = true;
  } else {//遷移

    if (countN < countMaxN) {
      if (!nextPro) {
        if (count < countMax) {//クリックしたら瞬時
          count = int(countMax);
          firstNode.addAll(DrawArrow(baseNode.get(0), baseNode.get(1), firstNode.get(0), firstNode.get(1), 50, 70, count));
          secondNode.addAll(DrawArrow(baseNode.get(0), baseNode.get(1), secondNode.get(0), secondNode.get(1), 50, 70, count)); 
          firstNode.subList(0, 16).clear();
          secondNode.subList(0, 16).clear();
        }

        nextPro=true;
        movePoint=0;
        processMemory.clear();

        //√決定
        float temp = random(1);

        if (temp<float(nodesA))baseNode.set(4, 0);//確立でノード決定
        else baseNode.set(4, 1);

        nodeSet = baseNode.get(4);

        if (baseNode.get(4)==0)processMemory.addAll(firstNode);//選んだ方を記憶
        else processMemory.addAll(secondNode);
        PVector dp = new PVector(processMemory.get(0)-baseNode.get(0), processMemory.get(1)-baseNode.get(1));
        dp.normalize();
        dp.mult(120);
        dummy1 = processMemory.get(0)+int(dp.x);
        dummy2 = processMemory.get(1)+int(dp.y);
        xC=yC=0;//初期化
        xCollection=baseNode.get(0)-processMemory.get(0);
        yCollection=baseNode.get(1)-processMemory.get(1);

        processMemory.set(0, processMemory.get(0)*2 -baseNode.get(0));
        processMemory.set(1, processMemory.get(1)*2 -baseNode.get(1));
        cheche.play();
        sanP=0;
        loveP=0;
        if (baseNode.get(4)==0) {
          san += int(nodes.get(5));
          love += int(nodes.get(5));
          sanP = int(nodes.get(5));
          loveP = int(nodes.get(5));
          
        } else {
          love -= int(nodes.get(6));
          loveP = int(nodes.get(6));
        }
      }

      xC = int(xCollection*(countN/countMaxN))*2;
      yC = int(yCollection*(countN/countMaxN))*2;



      processMemory.addAll(DrawArrow(dummy1 + xC, dummy2+ yC, processMemory.get(0)+ xC, processMemory.get(1)+ yC, 50, 70, countN));
      processMemory.subList(2, 18).clear();
    } else {
      bX= dummy1 + xC;
      bY=dummy2 + yC;
      situation=-1;
      count = int(countMax/4);
      countN = 0;
      nodeAction=false;
      processOver=false;
      nextPro=false;
    }

    fill(0);
    beginShape();
    for (int k=7; k<15; k+=2)vertex(baseNode.get(k) +xC, baseNode.get(k+1) + yC);
    endShape(CLOSE);
    beginShape();
    for (int k=15; k<21; k+=2)vertex(baseNode.get(k) +xC, baseNode.get(k+1) +yC);
    endShape(CLOSE);
    beginShape();
    for (int k=2; k<10; k+=2)vertex(firstNode.get(k) +xC, firstNode.get(k+1) +yC);
    endShape(CLOSE);
    beginShape();
    for (int k=10; k<16; k+=2)vertex(firstNode.get(k) +xC, firstNode.get(k+1) +yC);
    endShape(CLOSE);
    beginShape();
    for (int k=2; k<10; k+=2)vertex(secondNode.get(k) +xC, secondNode.get(k+1) +yC);
    endShape(CLOSE);
    beginShape();
    for (int k=10; k<16; k+=2)vertex(secondNode.get(k) +xC, secondNode.get(k+1) +yC);
    endShape(CLOSE);
    beginShape();
    for (int k=2; k<10; k+=2)vertex(processMemory.get(k), processMemory.get(k+1) );
    endShape(CLOSE);
    beginShape();
    for (int k=10; k<16; k+=2)vertex(processMemory.get(k), processMemory.get(k+1));
    endShape(CLOSE);

    fill(255);
    ellipse(baseNode.get(0) +xC, baseNode.get(1) +yC, 30*nodes.get(0).length(), 50);
    ellipse(firstNode.get(0) +xC, firstNode.get(1) +yC, 30*nodes.get(1).length(), 50);
    ellipse(secondNode.get(0) +xC, secondNode.get(1) +yC, 30*nodes.get(3).length(), 50);
    fill(0);
    text(nodes.get(0), baseNode.get(0) +xC, baseNode.get(1) +yC);
    text(nodes.get(1), firstNode.get(0) +xC, firstNode.get(1)+yC);
    text(nodes.get(3), secondNode.get(0) +xC, secondNode.get(1)+yC);
    textSize(40);
    fill(255);
    //text(nodes.get(2), (baseNode.get(0)+firstNode.get(0))/2 +xC, (baseNode.get(1)+firstNode.get(1))/2+yC);
    //text(nodes.get(4), (baseNode.get(0)+secondNode.get(0))/2 +xC, (baseNode.get(1)+secondNode.get(1))/2+yC);
    textSize(15);

    if (!check) {
      countN+=3;
    } else {
      if (baseNode.get(4)==0) {
        Check(firstNode.get(0), firstNode.get(1));
      } else {
        Check(secondNode.get(0), secondNode.get(1));
      }
    }
  }

  if (mouseOb) {
    if (firstNode.get(0)-100 < mouseX && mouseX<firstNode.get(0)+100 && firstNode.get(1)-200<mouseY && mouseY < firstNode.get(1)+50) {
      if (float(nodes.get(2))<1) {
        nodes.set(2, nf((float(nodes.get(2))+0.1), 1, 1));
        nodesA=nodes.get(2);
        nodes.set(4, nf((float(nodes.get(4))-0.1), 1, 1));
        nodesB=nodes.get(4);
      }
    } else if (secondNode.get(0)-100 < mouseX && mouseX<secondNode.get(0)+100 && secondNode.get(1)-200<mouseY && mouseY < secondNode.get(1)+50) {
      if (float(nodes.get(4))<1) {
        nodes.set(4, nf((float(nodes.get(4))+0.1), 1, 1));
        nodesB=nodes.get(4);
        nodes.set(2, nf((float(nodes.get(2))-0.1), 1, 1));
        nodesA=nodes.get(2);
      }
    }
    san -=5;//SAN値減少
    mouseOb=false;
  }
}


ArrayList<Integer> DrawArrow(int x, int y, int targetX, int targetY, int marginA, int marginB, float arrowLength) {//矢印生成　基点・目標・空白・長さ(割合)
  ArrayList<Integer> dummyValue = new ArrayList<Integer>();
  dummyValue.add(targetX);
  dummyValue.add(targetY);

  int arrowSize = 40;
  int shaftWidth = 10;

  targetX = x+ int((targetX-x) * arrowLength/countMax);
  targetY = y+ int((targetY-y) * arrowLength/countMax);

  PVector to = new PVector(targetX-x, targetY-y);
  to.normalize();
  to.mult(marginA);
  x+= to.x;
  y+= to.y;
  to.normalize();
  to.mult(marginB);
  targetX-= to.x;
  targetY-= to.y;
  to.normalize();

  beginShape();//rect
  to.rotate(PI/2);
  to.mult(shaftWidth);
  vertex(x+to.x, y+to.y);
  dummyValue.add(int(x+to.x));
  dummyValue.add(int(y+to.y));
  vertex(targetX+to.x, targetY+to.y);
  dummyValue.add(int(targetX+to.x));
  dummyValue.add(int(targetY+to.y));
  to.rotate(PI);
  vertex(targetX+to.x, targetY+to.y);
  dummyValue.add(int(targetX+to.x));
  dummyValue.add(int(targetY+to.y));
  vertex(x+to.x, y+to.y);
  dummyValue.add(int(x+to.x));
  dummyValue.add(int(y+to.y));
  to.rotate(PI/2);//元のベクトルに戻す
  endShape(CLOSE);

  beginShape();//arrowTriangle
  to.normalize();
  to.mult(arrowSize);
  vertex(targetX+to.x, targetY+to.y);
  dummyValue.add(int(targetX+to.x));
  dummyValue.add(int(targetY+to.y));
  to.normalize();
  to.mult(arrowSize/1.7);
  to.rotate(PI/2);
  vertex(targetX+to.x, targetY+to.y);
  dummyValue.add(int(targetX+to.x));
  dummyValue.add(int(targetY+to.y));
  to.rotate(PI);
  vertex(targetX+to.x, targetY+to.y);
  dummyValue.add(int(targetX+to.x));
  dummyValue.add(int(targetY+to.y));
  endShape(CLOSE);

  return dummyValue;
}

void PerBubble(int x, int y, int init, int num, int max, int fix, String tex) {
  num -=init;
  max -=init;
  if (num>max) num = max;
  float numf = num;
  tint( 200, (numf/max)*255);
  pushMatrix();
  translate(-10 +x, -10+y);
  rotate((PI/4)*log(numf/max)+radians(fix/4));
  image(sb, -50, -130);
  text(tex, 20, -70);
  popMatrix();
  tint( 200, 255);
}