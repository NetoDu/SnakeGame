
//Caracterisicas da comida da Snake
class Food {
  int x, y, w, h;
  color c;
  Food (int _x, int _y, int _w, int _h, color _c) {
    x = _x; //Posição X
    y = _y; //Posição Y
    w = _w; //Largura
    h = _h; //Altura
    c = _c; //Cor
  }
  void show(int vx, int vy){  // Velocidade X e Velocidade Y
    x += vx * w; //x recebe a velocidade x vezes o tamanho do objeto(comprimento)
    y += vy * h; //y recebe a velocidade y vezes o tamanho do objeto(altura)
    fill(c); //Colorir o objeto de acordo com a variavel C
    stroke(#9B0000); //Cor da borda da comida
    strokeWeight(2); //Espessura da borda
    rect(x, y, w, h); //Criar retangulo, 15 é referente ao arredondamento
    fill(#197600); //Cor da "folha" da comida
    stroke(#197700); //Cor da borda da folha
    strokeWeight(2); //Espessura da borda
    rect(x+10, y, 8, 20); //A folha em si, posição x,y e tamanho
  }
}

//Função para criar a comida da Snake
void newFood() {
  
  boolean f = false;
  while (!f) {
    f = true;
    food.x = int(random(width/szSn)) * szSn; //Calcular onde a comida irá aparecer randomicamente
    food.y = int(random(height/szSn)) * szSn;
    for (int i = 0; i < tam; i++) { //Verificar se a comida não irá aparecer em cima da Snake
      if (food.x == sn[i].x && food.y == sn[i].y)
        f = false;
    }
  }
}
