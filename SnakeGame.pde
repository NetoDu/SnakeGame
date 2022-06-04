import ddf.minim.*;
//Declaração das variáveis e objetos
Minim sManager; //Gerenciador de áudios do game
AudioPlayer sFood, sMenu, sGame, sEat; //Declaração as variaveis de som
int playSound = 0, x = 1, y, szSn = 40, tInit = 2, tam, pts, top, state, Cheats = 0, Debug = 0, Mode = 'i', SnakeColor = 'a', px, pf;
int nButtonsMenu = 4, nButtonsOptions = 5, nButtonsGameOver = 2, nButtonsCredits = 1, nButtonsHelp = 1, SnakeSpeed, SpeedByColor;
color cText = #ECF500, SnakeColorDefaut, SnakeStrokeColorDefaut; // cText -> Cor dos botões quando mouse passar em cima
boolean start, gMenu, drawBoxes;
boolean deadSnake = true;
PFont fText1, fText2; //Variaveis para fonte de texto
PImage[] imgSnake = new PImage [5];
Snake [] sn; //Vetor Snake
Button[] menuButtons, optionButtons, creditsButtons, helpButtons, gameOverButtons; //Vetor dos botões
Food food = new Food(0, 0, szSn, szSn, #BF2E2E); //Variavel da "comida" da Snake | Cor da comida


void setup () {
  size(800, 660); //Tamanho da tela
  height = 600; //Altura da tela, sem a barra de menu
  //frameRate(10); //Quandos frames por segundo

  //Vinculo fonte com variavel
  fText1 = createFont("Pixelmania.ttf", 50);
  fText2 = createFont("dogica.ttf", 30);

  //Carregar imagens
  imgSnake[0] = loadImage("images/snake0.png");
  imgSnake[1] = loadImage("images/snake1.png");
  imgSnake[2] = loadImage("images/snake2.png");
  imgSnake[3] = loadImage("images/snake3.png");
  imgSnake[4] = loadImage("images/snake4.png");

  //Vinculo arquivos de audio com as variaveis
  sManager = new Minim(this);
  sFood = sManager.loadFile("food.wav");
  sMenu = sManager.loadFile("menu.wav");
  sGame = sManager.loadFile("game.wav");
  sEat = sManager.loadFile("eat.wav");


  //Criação dos botões do Menu
  menuButtons = new Button[4];
  optionButtons = new Button[5];
  creditsButtons = new Button[1];
  helpButtons = new Button[1];
  gameOverButtons = new Button[2];

  //Botões do Menu Inicial
  menuButtons[0] = new Button("START GAME", new PVector(width/3.5, height*0.5), 40, color(255), color(cText));
  menuButtons[1] = new Button("OPTIONS", new PVector(width/2.8, height*0.6), 40, color(255), color(cText));
  menuButtons[2] = new Button("CREDITS", new PVector(width/2.8, height*0.7), 40, color(255), color(cText));
  menuButtons[3] = new Button("HELP", new PVector(width/2.3, height*0.8), 40, color(255), color(cText));

  //Botões do Menu de Opções
  optionButtons[0] = new Button("BACK", new PVector(width*0.45, height*0.9), 30, color(255), color(cText));
  optionButtons[1] = new Button(">GREEN (EASY)", new PVector(width*0.25, height*0.35), 30, color(255), color(cText));
  optionButtons[2] = new Button(">BROWN (MEDIUM)", new PVector(width*0.25, height*0.45), 30, color(255), color(cText));
  optionButtons[3] = new Button(">RED   (HARD)", new PVector(width*0.25, height*0.55), 30, color(255), color(cText));
  optionButtons[4] = new Button(">BLUE  (EXTREME)", new PVector(width*0.25, height*0.65), 30, color(255), color(cText));


  //Botões do Menu de Ajuda
  helpButtons[0] = new Button("BACK", new PVector(width*0.45, height*0.9), 30, color(255), color(cText));

  //Botões do Menu de Creditos
  creditsButtons[0] = new Button("BACK", new PVector(width*0.45, height*0.9), 30, color(255), color(cText));

  //Botões do Menu de GameOver
  gameOverButtons[0] = new Button("TRY AGAIN", new PVector(width*0.25, height*0.7), 50, color(255), color(cText));
  gameOverButtons[1] = new Button("BACK TO MENU", new PVector(width*0.3, height*0.9), 30, color(255), color(cText));

  drawBoxes = false;
}

void draw() {

  if (start && gMenu) {//Iniciar o jogo somente se for dado o Start
    if (frameCount % SnakeSpeed == 0)  
    GameScreen();
  } else
    TitleScreen();

  //Barra do menu
  fill(#004814); //Pintar fundo do menu
  noStroke(); //Sem bordas
  rect(0, 600, width, 60); //Retangulo do menu
  fill(255); //Cor do texto
  noStroke(); //Sem bordas
  textSize(30); //Tamanho da fonte
  textFont(fText2);
  text("Score " + pts, 20, 640); //Texto, variavel e posição
  text("Highscore " + top, 360, 640); //Texto, variavel e posição

  //Efeitos Sonoros do game
  if (playSound == 1) {
    sGame.pause();    //Pausar música do jogo
    sGame.rewind();   //Reiniciar música
    sMenu.play();     //Tocar a música do menu
  } else if (playSound == 2) {
    sMenu.pause();    //Pausar música do menu
    sMenu.rewind();   //Reiniciar música do menu
  }


  switch (Mode) {
  case 'i':        //Modo inicial
    break;
  case 's':        //Caso Mode esteja como 's', iniciar o jogo
    start = true;
    break;
  case 'o' :       //Caso Mode esteja como 'o', abrir menu de opções
    OptionsMenu();
    break;
  case 'c':       //Caso Mode esteja como 'c', abrir menu de creditos
    CreditsMenu();
    break;
  case 'h':       //Caso Mode esteja como 'h', abrir menu de ajuda
    HelpMenu();
    break;
  case 'd':        //Caso Mode esteja como 'd', resetar o jogo
    start = false;
    Mode = 'g';
    break;
  case 'b' :       //Caso Mode esteja como 'b', voltar para menu inicial
    Mode = 'i';
    break;
  case 'g' :       //Caso Mode esteja como 'b', voltar para menu inicial
    GameOverMenu();
    break;
  }

  switch (SnakeColor) {  //Seletor de cor da Snake
  case 'a':        //Snake na cor VERDE
    SnakeColorDefaut = #01803c;
    SnakeStrokeColorDefaut = #00401e;
    optionButtons[1].textColor = #ECF500;
    optionButtons[2].textColor = 255;
    optionButtons[3].textColor = 255;
    optionButtons[4].textColor = 255;
    SpeedByColor = 7;
    
    break;
  case 'b':        //Snake na cor MARROM
    SnakeColorDefaut = #764D33;
    SnakeStrokeColorDefaut = #392214;
    optionButtons[2].textColor = #ECF500;
    optionButtons[1].textColor = 255;
    optionButtons[3].textColor = 255;
    optionButtons[4].textColor = 255;
    SpeedByColor = 5;
    
    break;
  case 'c' :       //Snake na cor VERMELHO
    SnakeColorDefaut = #CE383B;
    SnakeStrokeColorDefaut = #B40407;
    optionButtons[3].textColor = #ECF500;
    optionButtons[1].textColor = 255;
    optionButtons[2].textColor = 255;
    optionButtons[4].textColor = 255;
    SpeedByColor = 4;

    break;
  case 'd':       //Snake na cor AZUL
    SnakeColorDefaut = #06B5C4;
    SnakeStrokeColorDefaut = #009392;
    optionButtons[4].textColor = #ECF500;
    optionButtons[1].textColor = 255;
    optionButtons[2].textColor = 255;
    optionButtons[3].textColor = 255;
    SpeedByColor = 3;

    break;
  }

  
}
