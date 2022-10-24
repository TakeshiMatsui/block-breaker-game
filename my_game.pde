int block[] = new int[30];
float x, y, b_w = 10, b_h = 10, dx, dy;
float r_w = 60.0, r_h = 15.0;
PImage img; //画像データ
int  count = 0;

void setup() {
  size(400,300);
  initBall();
  initBlocks();
  img = loadImage("宇宙.jpg");//背景画像読み込み
}

void draw() {  
  x += dx; // dx は1フレームごとにx方向に動く距離(速度)
  y += dy; // dy は1フレームごとにy方向に動く距離(速度)
  
  image(img, 0, 0);//背景画像を表示
  fill(255);
  rectMode(CORNER);
  ellipse(x, y, b_w, b_h); // ball

  checkBlocks();
  showBlocks();
  
  checkAndShowRacket(height-50);

  // 壁との衝突
  if(y + b_h >= height && count<60*3){
    background(0);
    text("GAMEOVER",width/2-40,height/2);//ボールを落とすとGAMEOVERと表示
    count++;
  }else if (y + b_h >= height && count>=60*3) {//３秒後にゲーム再開
    initBall();
    initBlocks();
    count=0;
  }
  if (x-b_w/2 < 0 || x+b_w/2 >=width) {dx = -dx;}
  if (y-b_h/2 < 0) {dy = -dy;}
}
