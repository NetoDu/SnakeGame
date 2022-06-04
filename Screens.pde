//MENU INICIAL
void TitleScreen() {
  gMenu = false;
  playSound = 1; //Tocar musica do menu
  background(#027C22); //Fundo da tela inicial


  textFont(fText2);
  for (int i = 0; i < nButtonsMenu; i++) {
    menuButtons[i].draw(drawBoxes);
  }


  fill(255); //Cor do texto
  textFont(fText1);
  //textAlign(CENTER, CENTER); //Alinhamento do texto inicial
  text("SNAKE GAME", width*0.05, height/5); //Texto e tamanho de acordo com o widht,height

  SnakeAnimation();


  if (start) { //Quando iniciar o jogo..
    x = 1; //Posição inicial X
    y = 0; //Posição inicial Y
    tam = tInit; //Definir tamanho da Snake para o padrão inicial
    pts = 0; //Zerar pontuação inicial
    SnakeSpeed = SpeedByColor; //Voltar velocidade da Snake para o padrão
    piece(); //Pedaços da Snake
    playSound = 2; //Pausar musica do menu e reiniciar ela
    sEat.pause();
    sGame.loop();  //Tocar musica do jogo em loop
    gMenu = true;
  }
}


//MENU OPÇÕES
void OptionsMenu() {
  background(#004814); //Cor do fundo da tela
  fill(255); //Cor do texto
  textFont(fText2);
  text("OPTIONS", width*0.4, height*0.1); //Texto e tamanho de acordo com o widht,height
  text("DIFFICULTY:", width*0.17, height*0.3);
  for (int i = 0; i < nButtonsOptions; i++) {
    optionButtons[i].draw(drawBoxes);
  }
}

//MENU CREDITOS
void CreditsMenu() {
  background(#004814); //Cor do fundo da tela
  fill(255); //Cor do texto
  textFont(fText2);
  text("CREDITS", width*0.4, height*0.1); //Texto e tamanho de acordo com o widht,height
  textSize(40);
  text(">EDUARDO CARDOSO ", width*0.1, height*0.4); //Texto e tamanho de acordo com o widht,height
  text(">JOAO LUIZ BORGES ", width*0.1, height*0.6); //Texto e tamanho de acordo com o widht,height
  text(">RAFAEL ELIAS ", width*0.1, height*0.8); //Texto e tamanho de acordo com o widht,height
  for (int i = 0; i < nButtonsCredits; i++) {
    creditsButtons[i].draw(drawBoxes);
  }
}

//MENU DE HELP
void HelpMenu() {
  background(#004814); //Cor do fundo da tela
  fill(255); //Cor do texto
  textFont(fText2);
  text("HELP", width*0.45, height*0.1); //Texto e tamanho de acordo com o widht,height
  textFont(fText2);
  textSize(20);
  String txtHelp = ">O objetivo do jogo SnakeGame é fazer o maximo de pontos possiveis sem morrer. Cada vez que voce pega uma comida, a Snake ira aumentar de tamanho. Quanto maior a Snake ficar, mais rapido ela se movimentara.";
  String txtHelp1 = ">Para movimentar a Snake, utilize as setas: cima, baixo, esquerda e direita. Para iniciar o jogo aperte a tecla 'a'.";
  text(txtHelp, 10, 100, 790, 200); //Texto e tamanho de acordo com o widht,height
  text(txtHelp1, 10, 250, 790, 400); //Texto e tamanho de acordo com o widht,height
  for (int i = 0; i < nButtonsHelp; i++) {
    helpButtons[i].draw(drawBoxes);
  }
}

//GAME OVER
void GameOverMenu() {
  background(#004814); //Cor do fundo da tela
  fill(255); //Cor do texto
  textFont(fText1);
  text("GAMEOVER", width*0.13, height/5); //Texto e tamanho de acordo com o widht,height
  textFont(fText2);
  text("Score: "+pts, width*0.3, height/2.5); //Texto e tamanho de acordo com o widht,height
  textFont(fText2);
  for (int i = 0; i < nButtonsGameOver; i++) {
    gameOverButtons[i].draw(drawBoxes);
  }
}

//TELA DE JOGO
void GameScreen() {
  background(#2FBC5B); //Cor do fundo da tela


  for (int i = tam-1; i >=0; i--) { //Laço para mostrar todas as peças

    if (i == 0) {  //Se i for 0 (primeira peça) ela será movimentada
      sn[i].show(x, y);
    } else { //Se for peça do corpo, ele irá apenas seguir a cabeça
      sn[i].x = sn[i-1].x;  //posição X anterior -1
      sn[i].y = sn[i-1].y;  //posição Y anterior -1
      sn[i].show(0, 0); //Mostrar o objeto parado 0,0
    }

    //Se a Snake bater no proprio corpo ou nas bordas da tela, termina o jogo
    if ((i > 2 && sn[0].x == sn[i].x && sn[0].y == sn[i].y) ||
      sn[0].x < 0 || sn[0].y < 0 || sn[0].x > width-szSn || sn[0].y > height-szSn) //Conferir pontos x,y altura e largura
      if (Cheats == 1) {
      } else
        Mode = 'd'; //Resetar jogo quando a Snake morrer
  }

  food.show(0, 0);

  //Conferir se a Snake pegou a comida & conferir highscore & adicionar novo piece
  if (sn[0].x == food.x && sn[0].y == food.y) {
    pts += 10; //Adicionar +10 pontos a cada comida
   
     if (pts == 50  && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 100 && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 150 && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 200 && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 250 && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 300 && SnakeSpeed > 0) SnakeSpeed--;
     
    if (pts > top) top = pts; //Se a pontuação for maior que o highscore, ela se tornara o highscore

    String highscores = ("top");
    String[] list = split(highscores, ' ');
    saveStrings("highscores.txt", list); //Salvar as strings em um arquivo txt

    piece(); //Chamar "piece" para adicionar mais uma peça a Snake
  }

  //Mostrar mensagem "Cheats ON" quando habilitado
  switch(Cheats) {
  case 0:
    break;
  case 1:
    textSize(80); //Tamanho do texto
    //textAlign(CENTER, CENTER); //Alinhamento do texto inicial
    fill(255); //Cor do texto
    text("CHEATS ON", width*0.05, height*0.5); //Texto e tamanho de acordo com o widht,height
    break;
  }

  //Mostrar informações para debug
  switch(Debug) {
  case 0:
    break;
  case 1:
    textSize(30); //Tamanho do texto
    fill(255); //Cor do texto
    text("X: "+x, width*0.1, height*0.2);
    text("Y: "+y, width*0.1, height*0.3);
    text("Framecout: "+(frameCount), width*0.1, height*0.6);
    text("FPS: "+frameRate, width*0.1, height*0.7);
    text("SnakeSpeed: "+ SnakeSpeed, width*0.1, height*0.8);
    //text("VY: "+ show.vy, width*0.1, height*0.9);
    break;
  }
}
