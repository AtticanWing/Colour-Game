void gameover() {

  background(#890000); //red bg

//gif display-------------------------------------------------------------------------------------
  PImage frame2 = gifGameover.get(nFrames2);
  image(frame2, 0, 0, width, height);
  nFrames2++;
  if (nFrames2==100) nFrames2 = 0;

//text displays-----------------------------------------------------------------------------------
  textSize(100);
  fill(0);
  text("GAME OVER", 400, 175);

  textSize(40);
  text("SCORE: " + score, 400, 575);
  text("HIGHSCORE: " + highscore, 400, 650);

//tactile retry button----------------------------------------------------------------------------
  if (mouseX>300 && mouseY<450 && mouseX<500 && mouseY>350) {
    fill(150);
  } else {
    fill(0);
  }
  rect(300, 350, 200, 100);
  
  if (mouseX>300 && mouseY<450 && mouseX<500 && mouseY>350) {
    fill(0);
  } else {
    fill(255);
  }
  textSize(42);
  text("RETRY", 400, 400);
}


void gameoverClicks() {
  
  if (mouseX>300 && mouseY<450 && mouseX<500 && mouseY>350) { //if retry button pressed, game resets except for highscore
    chance();
    score = 0;
    wordSize = 1;
    timer = 199;
    mode = INTRO;
  }
}
