class Snake {
  int x, y, w, h;
  boolean head = false;
  color c;

  Snake (int _x, int _y, int _w, int _h, color _c) {
    x = _x; //Posição X
    y = _y; //Posição Y
    w = _w; //Largura
    h = _h; //Altura
    c = _c; //Cor
  }

  void show(int vx, int vy) {  // Velocidade X e Velocidade Y

    x += vx * h; //x recebe a velocidade x vezes o tamanho do objeto(comprimento)
    y += vy * w; //y recebe a velocidade y vezes o tamanho do objeto(altura)

    fill(c); //Colorir o objeto de acordo com a variavel C
    stroke(SnakeStrokeColorDefaut); //Cor da borda
    strokeWeight(3); //Espessura da borda
    rect(x, y, w, h); //Criar retangulo, 15 é referente ao arredondamento

    if (head == true) {
      fill(0); //Cor dos olhos da Snake
      noStroke(); //Tirar bordas
      rect(x+25, y+25, 7, 7); //Posição x,y e tamanho dos olhos
      rect(x+25, y+10, 7, 7); //Posição x,y e tamanho dos olhos
    } else {
      return;
    }
  }
}


//Função para aumentar a Snake cada vez que ela comer mais comida
void piece() {  //Toda vez que "piece" for chamado, a snake irá aumentar
  tam++;
  sEat.play();
  sEat.rewind();
  color c = SnakeColorDefaut; //Cor da Snake
  int[][] xy = new int [2][tam]; //Matriz para guardar posições anteriores

  for (int i = 0; i < tam-1; i++) {
    if (tam > tInit+1) { //Verificar se o tamanho é maior que o tamanho inicial
      xy[0][i] = sn[i].x;
      xy[1][i] = sn[i].y;
    } else {
      xy[0][i] = szSn * 5;
      xy[1][i] = szSn * 2;
    }
  }

  sn = new Snake[tam]; //Declaração do objeto com tamanho inicial "tam"
  for (int i = 0; i < tam; i++) {  //Laço para aumentar as peças da Snake
    sn[i] = new Snake(xy[0][i], xy[1][i], szSn, szSn, c);
  }

  sn[0].c = SnakeColorDefaut; //Pintar o lider de cor diferente
  sn[0].head = true;
  newFood(); //Pra gerar comida a cada nova piece tambem
}
