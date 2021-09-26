//Vanessa Lu
//Sep. 20, 2021
//Colour Game

//mode framework----------------------------------------------------------------------------------------------
final int INTRO = 0;
final int GAME  = 1;
final int GAMEOVER = 2;
final int PAUSE = 3;
final int OPTIONS = 4;
int mode;

//gif variables-----------------------------------------------------------------------------------------------
PImage[] gifIntro;
int nFrames1 = 43;
int frame;

ArrayList <PImage> gifGameover; //wanted to try using Arraylist for gifs
int nFrames2 = 0;
int frame2;

PImage[] gifPause;
int nFrames3 = 7;
int frame3;

//arrays------------------------------------------------------------------------------------------------------
String[] words;
color[] colors;
int w, c;

//font variable-----------------------------------------------------------------------------------------------
PFont valorant;

//game variables----------------------------------------------------------------------------------------------
int score, highscore; //score
int x, y;  //width/2, height/2
int chance; //50-50 chance of match

//title variables---------------------------------------------------------------------------------------------
float titleAngle = 0;
float angle = 1;

//timer variables---------------------------------------------------------------------------------------------
int timer = 199;
int wordSize = 1;

//pause variables---------------------------------------------------------------------------------------------
float xp = 725;
float yp = 75;


void setup() {
  
  size(800, 800);

//text + font setup-------------------------------------------------------------------------------------------
  valorant = createFont("Valorant.ttf", 200); //custom font
  textAlign(CENTER, CENTER);

//game setup--------------------------------------------------------------------------------------------------
  mode = INTRO;
  score = 0;
  x = width/2;
  y = height/2;

//arrays setup------------------------------------------------------------------------------------------------
  words = new String[9];
  colors = new color[9];
  
  //colour name array
  words[0] = "Red";
  words[1] = "Blue";
  words[2] = "Green";
  words[3] = "Yellow";
  words[4] = "Orange";
  words[5] = "Purple";
  words[6] = "Black";
  words[7] = "White";
  words[8] = "Pink";

  //colour array
  colors[0] = #FF124F;
  colors[1] = #B9F2FF;
  colors[2] = #BDFFB4;
  colors[3] = #FCFFAD;
  colors[4] = #FFBC74;
  colors[5] = #CDAAFF;
  colors[6] = #2B2C2C;
  colors[7] = #FFFFF5;
  colors[8] = #FFE8F6;

//gif setup---------------------------------------------------------------------------------------------------
  gifIntro = new PImage[nFrames1]; //build the list
  gifGameover = new ArrayList<PImage>(); //build arraylist
  gifPause = new PImage[nFrames3];

  int i = 0;
  int i2 = 0;
  int i3 = 0;
  while (i < nFrames1) {
    gifIntro[i] = (loadImage("frame_" + i + "_delay-0.04s.gif"));
    i++;
  }
  while (i2 < 100) {
    gifGameover.add(loadImage("frame_0" + i2 + "_delay-0.04s.gif"));
    i2++;
  }
  while (i3 < nFrames3) {
    gifPause[i3] = (loadImage("frame_" + i3 + "_delay-0.15s.gif"));
    i3++;
  }
}


void draw() {
  
  textFont(valorant); //custom font running

//mode framework------------------------------------------------------------------------------------------------
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {  
    pause();
  } else {
    println("?");
  }
}
