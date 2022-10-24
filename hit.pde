/*
 ふたつの図形が重なるかどうかをしらべて、
 重なったとき:true, 重ならないとき:false を返す
*/
boolean isOverlap(float x1, float y1, float w1, float h1, 
  float x2, float y2, float w2, float h2) {
  return x1 < x2+w2 && x2 < x1+w1 && y1 < y2+h2 && y2 < y1+h1;
}

/*
 ブロックの位置と大きさ、
 ボールの位置と大きさ、ボールの移動速度の情報を与えて
 跳ね返る方向（x軸、y軸の別）を返す
 跳ね返らない時: 0
 x軸のみの時: 1
 y軸のみの時: 2
 x軸, y軸両方の時: 3
*/
int blockHitCheck(float x, float y, float w, float h,
 float bx, float by, float bw, float bh, float dx, float dy) {
  int xflag = 0, yflag = 0;
  
  if (!isOverlap(x,y,w,h,bx+dx,by+dy,bw,bh)) {
    return 0; // ぶつからなかったら 0を返す
  }
  
  if (isOverlap(x,y,w,h,bx+dx,by,bw,bh)) xflag = 1;
  if (isOverlap(x,y,w,h,bx,by+dy,bw,bh)) yflag = 2;
  if (xflag + yflag > 0) { return xflag + yflag;}
  return 3;
}
