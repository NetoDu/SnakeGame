void mousePressed() {
  if (menuButtons[0].containsMouse() && Mode =='i') {  //Se o botão "0" for clicado, iniciará o jogo
     Mode = 's';
  }
  if (menuButtons[1].containsMouse() && Mode =='i') {  //Se o botão "1" for clicado, abrirá o menu de Opções
     Mode = 'o';
  }
  if (menuButtons[2].containsMouse() && Mode =='i') {  //Se o botão "2" for clicado, abrirá os créditos
     Mode = 'c';
  }
  if (menuButtons[3].containsMouse() && Mode =='i') {  //Se o botão "3" for clicado, abrirá o menu de ajuda
     Mode = 'h';
  }  
  if (optionButtons[0].containsMouse() && Mode =='o') {  //Se o botão "0" do menu options for clicado,
     Mode = 'b';                                    //irá voltar para o menu inicial
  }   
  if (creditsButtons[0].containsMouse() && Mode =='c') {  //Se o botão "0" do menu credits for clicado,
     Mode = 'b';                                    //irá voltar para o menu inicial
  } 
  if (helpButtons[0].containsMouse() && Mode =='h') {  //Se o botão "0" do menu help for clicado,
     Mode = 'b';                                    //irá voltar para o menu inicial
  } 
  if (gameOverButtons[0].containsMouse() && Mode =='g') {  //Se o botão "0" do menu gameover for clicado,
     Mode = 's';                                    //irá inicar o jogo novamente
  } 
  if (gameOverButtons[1].containsMouse() && Mode =='g') {  //Se o botão "0" do menu gameover for clicado,
     Mode = 'i';                                    //irá voltar para o menu inicial
  }  
  if (optionButtons[1].containsMouse() && Mode =='o') {  //Se o botão "1" do menu Options for clicado,
     SnakeColor = 'a';                                    //Snake passará para a cor VERDE
  } 
  if (optionButtons[2].containsMouse() && Mode =='o') {  //Se o botão "2" do menu Options for clicado,
     SnakeColor = 'b';                                    //Snake passará para a cor MARROM
  } 
  if (optionButtons[3].containsMouse() && Mode =='o') {  //Se o botão "3" do menu Options for clicado,
     SnakeColor = 'c';                                    //Snake passará para a cor VERMELHO
  } 
  if (optionButtons[4].containsMouse() && Mode =='o') {  //Se o botão "4" do menu Options for clicado,
     SnakeColor = 'd';                                    //Snake passará para a cor AZUL
  } 
}

void keyPressed() {
  if (keyCode == LEFT && x == 0) { //Caso seja apertado a seta para esquerda, definir X como -1 e Y como 0
    x = -1;
    y =  0;
  } else if (keyCode == UP && y == 0) { //Caso seja apertado a seta para cima, definir X como 0 e Y como -1
    y = -1;
    x =  0;
  } else if (keyCode == RIGHT && x == 0) { //Caso seja apertado a seta para direita, definir X como 1 e Y como 0
    x = 1;
    y = 0;
  } else if (keyCode == DOWN && y == 0) { //Caso seja apertado a seta para baixo, definir X como 0 e Y como 1
    y = 1;
    x = 0;
  } else if (key == 'a' && !start) Mode = 's';  //Caso seja apertado a tecla "a", start passará para "true"
  
  if ( key == 'c' ) Cheats++;  //Habilitar ou desabilitar Cheats
  if ( Cheats > 1 ) {
    Cheats = 0;
  }
  if ( key == 'd' ) Debug++;  //Habilitar ou desabilitar Debug mode
  if ( Debug > 1 ) {
    Debug = 0;
  }
  if ( key == 's' ) SnakeSpeed --; //Aumentar a velocidade da Snake quando for apertado a tecla "s"
  
}
