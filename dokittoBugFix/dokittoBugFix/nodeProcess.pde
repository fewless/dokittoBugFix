boolean processOver = false;
ArrayList<Integer> processMemory = new ArrayList<Integer>();
ArrayList<Integer> baseNode = new ArrayList<Integer>();// x/y/phase(not used) / situation / choice / takeDigree(4+3points)+long /targetX/tartgetY
ArrayList<Integer> firstNode = new ArrayList<Integer>();// x/y/takeDigree(4+3points)+long
ArrayList<Integer> secondNode = new ArrayList<Integer>();// x/y/takeDigree(4+3points)+long
void NodeProcess(ArrayList<String> nodes, int situ) {//+before info
  if (!processOver) {//一回目は処理する
    
    baseNode.clear();//初期化
    firstNode.clear();
    secondNode.clear();

    int positionX = 120;
    int positionY = 80;
    
    baseNode.add(positionX);
    baseNode.add(positionY);
    baseNode.add(0);
    baseNode.add(situ);//シチュエーション記録
    baseNode.add(int(random(2)));

    int maxDig= 90;//角度最大
    int digCollect = -10;//角度補正値

    baseNode.addAll(DrawArrow(-100, -100, positionX, positionY, 50, 70));
    fill(255);
    ellipse(positionX, positionY, 40*nodes.get(0).length(), 50);
    fill(0);
    text(nodes.get(0), positionX, positionY);
    int digs=0;

    for (int i=0; i<int(nodes.size()/2); i++) {
      int num = i*2 +1;
      int distance=int(random(150, 300));//ノード間の距離min max
      digs += int(random(30, digs +maxDig/2));
      int newX = positionX + int(distance*cos(radians(digs + digCollect)));
      int newY = positionY + int(distance*sin(radians(digs + digCollect)));
      if(i==0)firstNode.addAll(DrawArrow(positionX, positionY, newX, newY, 50, 70));
      else secondNode.addAll(DrawArrow(positionX, positionY, newX, newY, 50, 70));
      
      fill(255);
      ellipse(newX, newY, 30*nodes.get(num).length(), 50);
      textSize(40);
      text(nodes.get(num+1), (positionX+newX)/2, (positionY+newY)/2);
      fill(0);
      textSize(15);
      text(nodes.get(num), newX, newY);
    }
    processOver = true;
  } else {//読み込んで処理
    println("readingProcess");
    fill(255);
    ellipse(baseNode.get(0), baseNode.get(1), 40*nodes.get(0).length(), 50);
    fill(0);
    text(nodes.get(0), baseNode.get(0), baseNode.get(1));
    beginShape();
    for(int k=5;k<13;k+=2)vertex(baseNode.get(k),baseNode.get(k+1));
    endShape(CLOSE);
    beginShape();
    for(int k=13;k<19;k+=2)vertex(baseNode.get(k),baseNode.get(k+1));
    endShape(CLOSE);
  }
}


ArrayList<Integer> DrawArrow(int x, int y, int targetX, int targetY, int marginA, int marginB) {
  ArrayList<Integer> dummyValue = new ArrayList<Integer>();
  
  int arrowSize = 40;
  int shaftWidth = 10;

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
  dummyValue.add(int(dist(x, y, targetX, targetY)));
  
  dummyValue.add(targetX);
  dummyValue.add(targetY);

  return dummyValue;
}