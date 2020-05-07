ArrayList<NODES> stacks = new ArrayList<NODES>();

int xCollection = 500;
int yCollection = 500;
//int collecitonCount = 0;



class NODES{
  int pointX;
  int pointY;
  int nodes;
  int choice;
  
  NODES(int px,int py,int nd, int ch){
    this.pointX = px;
    this.pointY = py;
    this.nodes  = nd;
    this.choice = ch;
  }
  
  
  int getX(){
    return this.pointX;
  }
  
  int getY(){
    return this.pointY;
  }
  
  int getN(){
    return this.nodes;
  }
  
  int getC(){
    return this.choice;
  }
}


int countx;
int county;

void End1(){
  image(end, 0, 0);
  
  
  
}