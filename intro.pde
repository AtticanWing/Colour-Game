void intro() { 

//gif display----------------------------------------------------------------------------------
  image(gifIntro[frame], 0, 0, width, height);
  frame++;
  if (frame == nFrames1) frame = 0;

//game title rotating--------------------------------------------------------------------------
  pushMatrix();
  translate(400,250);
  textSize(60);

  rotate(radians(titleAngle));
  titleAngle = titleAngle + 2*angle;
  if (titleAngle < -30) {
    angle = angle *-1;
  }
  if (titleAngle > 30) {
    angle = angle *-1;
  }
  
  //title is tactile when hover over start button
  if (mouseX>300 && mouseY<600 && mouseX<500 && mouseY>500) {
    fill(255);
    stroke(0);
  } else {
    fill(0);
    stroke(255);
  }
  rect(-250,-45, 500,100);
  
  if (mouseX>300 && mouseY<600 && mouseX<500 && mouseY>500) {
    fill(0);
  } else {
    fill(255);
  }
  text("COLOUR GAME", 0, 0);
  
  popMatrix(); //push + pop so other shapes don't rotate as well
  
//tactile start button--------------------------------------------------------------------------
  if (mouseX>300 && mouseY<600 && mouseX<500 && mouseY>500) {
    stroke(255);
  } else {
    stroke(0);
  }
  fill(0);
  rect(300, 500, 200, 100);
  
  if (mouseX>300 && mouseY<600 && mouseX<500 && mouseY>500) {
    fill(0);
  } else {
    fill(255);
  }
  text("START", 400, 545); 
  
}


void introClicks() {
  
  if (mouseX>300 && mouseY<600 && mouseX<500 && mouseY>500) { //if start button pressed, mode switches to game
    mode = GAME;
    chance();
  } 
}
