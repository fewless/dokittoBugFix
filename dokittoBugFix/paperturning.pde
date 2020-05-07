PaperTurning a;
int daw= width;

class PaperTurning{//処理と表示は分けてタイミングを選べるようにする
  int bx;//bedore x position
  int by;
  PImage screen;
  int count;//めくりのカウント
  int darks=5;//裏面の暗さ
  
  PaperTurning(int px,int py){
    screen = get();
    screen.loadPixels();
    this.bx = px;
    this.by = py;
    this.count =0;//axis
  }
  
  void grip(int x,int y,int cou){//基本的にはmouseX,Yの取得
    screen.loadPixels();
    //background(255);
    loadPixels();
    this.count = (width-cou)/2;
    if(count<0)
      count =0;
    for(int i=0;i<count ;i++){
      for(int k=0;k<height;k++){
        if(width-1-i -count>=0){
          //pixels[width-1-i -count +k*width]=screen.pixels[width-1+i -count+k*width];
          int co = (screen.pixels[width-1+i -count+k*width]);
          color dum = color(red(co)/darks,green(co)/darks,blue(co)/darks);
          pixels[width-1-i -count +k*width]= dum;
        }
      }
    }
    fill(255);
    for(int i=0;i<width-count*2 ;i++){
      for(int k=0;k<height;k++){
        pixels[i+k*width]=screen.pixels[i+k*width];
      }
    }
    //if(count<width)count+=4;
  }
  
  int getX(){
    return this.bx;
  }
  
  int getY(){
    return this.by;
  }
  
}