float bw;
float bh = 20.0;

/*
 30個のブロックを初期化する
*/
void initBlocks() {
  for (int i = 0; i < block.length ; i++) {
    block[i] = 3;
  }
  bw = width /( block.length/3); // ブロックの幅を決める
}

/*
 30個のブロックのどれかにぶつかっていたら跳ね返る
*/
void checkBlocks() {
  for (int i = 0; i < block.length ; i++) {
    if (block[i] > 0 ) {
      int ret = blockHitCheck((i%10)*bw, (i/10)*20+20,bw,bh,x,y,b_w,b_h,dx,dy);
      if (ret > 0) {
        if (ret == 1) {
          dx = -dx;
          block[i]--;
        } else if (ret == 2) {
          dy = -dy;
          block[i]--;
        } else if (ret == 3) {
          dx = -dx;
          dy = -dy;
          block[i]--;
        }
        return;
      }
    }
  }  
}

/*
 30個のブロックを表示する
*/
void showBlocks() {
  for (int i = 0; i < block.length ; i++) {
    if (block[i] == 3) {
      fill(0,255,0);
      rectMode(CORNER);
    rect((i%10)*bw, (i/10)*20+20, bw, bh);
  }else if(block[i] == 2){
      fill(255,255,0);
       rect((i%10)*bw, (i/10)*20+20, bw, bh);
    }else if(block[i] ==1){
      fill(255,0,0);
       rect((i%10)*bw, (i/10)*20+20, bw, bh);
    }
    }
  }
