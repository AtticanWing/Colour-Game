void pause() {
  
  background(150);

//gif display------------------------------------------------------------------------------------------
  pushMatrix();
  frameRate(10); //made it slower so it doesn't switch too fast
  image(gifPause[frame3], 0, 0, width, height);
  frame3++;
  if (frame3 == nFrames3) frame3 = 0;
  popMatrix();

//tactile resume button---------------------------------------------------------------------------------
  if (mouseX>300 && mouseY<750 && mouseX<500 && mouseY>650) {
    fill(255);
  } else {
    fill(0);
  }
  rect(300, 650, 200, 100);
  
  if (mouseX>300 && mouseY<750 && mouseX<500 && mouseY>650) {
    fill(150);
  } else {
    fill(0);
  }
  textSize(180);
  text("PAUSE", 400,100);
  
  if (mouseX>300 && mouseY<750 && mouseX<500 && mouseY>650) {
    fill(0);
  } else {
    fill(255);
  }
  textSize(42);
  text("RESUME", 400, 700);
}


void pauseClicks() {
  
  if (mouseX>300 && mouseY<750 && mouseX<500 && mouseY>650) { //if resume button pressed, mode switches back to game and framerate goes back to default
    mode = GAME;
    frameRate(60);
  }
}
