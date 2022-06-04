void SnakeAnimation(){
  
  image(imgSnake[pf], px, height*0.3);
  if(++pf > 4) pf = 0;
  if((px += 10) > width) px = -243;
  
}
