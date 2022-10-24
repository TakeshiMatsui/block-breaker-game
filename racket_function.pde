/*
  checkAndShowRacket()
*/
void checkAndShowRacket(float r_y) {
  float r_x =mouseX; // r_x はラケットの左側のx座標
  
  if (r_x + r_w/2 > width) { // 右に寄りすぎていたら補正する
    r_x = width - r_w/2;
  } 
  if (r_x < r_w/2){
    r_x = r_w/2;
  }
  
  /* ブロックがぶつかっていたら上に跳ね返る */
  /*ラケットの端にあたるほどボールが横に飛ぶ*/
  if (blockHitCheck(r_x-r_w/2,r_y,r_w,r_h,x,y,b_w,b_h,dx,dy ) > 0 && x>r_x ) {
    dy = abs(x-r_x)*1/20-3;
    dx = abs(x-r_x)*1/20+2;
  }else if(blockHitCheck(r_x-r_w/2,r_y,r_w,r_h,x,y,b_w,b_h,dx,dy ) > 0 && x<=r_x ){
    dy = abs(x-r_x)*1/20-3;
    dx = -abs(x-r_x)*1/20-2;
  }
  fill(255);
  ellipse(r_x, r_y, r_w, r_h); // racketを表示する
}
