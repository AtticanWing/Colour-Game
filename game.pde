void game() {
  
  background(150);

//true and false rectangles------------------------------------------------------------------------------
  fill(#E4DEC8);
  rect(0,0,x,height);
  fill(#7B6647);
  rect(x,0, x, height);

//colour name + size (timer display #1)-----------------------------------------------------------------
  textSize(wordSize);
  wordSize += 2; //word size increases by 2 every frame
  if (wordSize > 200) {
    mode = GAMEOVER; 
  }

//highscore updating------------------------------------------------------------------------------------
  if (score >= highscore) {
    highscore = score;
  }

//puzzle display----------------------------------------------------------------------------------------
  fill(colors[c]);
  text(words[w], x, y);

//score + highscore display-----------------------------------------------------------------------------
  textSize(20);
  fill(0);
  text("SCORE: " + score, 60,65);
  text("HIGHSCORE: " + highscore, 85,100);
  
//tactile true and false display------------------------------------------------------------------------
  textSize(40);
  if (mouseX < x) {          
    text("FALSE", 600,700);
    fill(255);
    text("TRUE", 200,700);
  } else if (mouseX > x) {
    text("TRUE", 200,700);
    fill(255);
    text("FALSE", 600,700);
  }
  
//timer display #2 (rectangle)-----------------------------------------------------------------------
  fill(0);
  rect(300,50, timer,50); 
  timer -= 2; //rect width gets smaller by 2 every frame

//pause button---------------------------------------------------------------------------------------
  noStroke();
  ellipse(xp,yp,100,100);
  fill(#D7C0A2);
  rect(700,50,15,50);
  rect(735,50,15,50);
  
//time elapsed counter--------------------------------------------------------------------------------
  gameFrames += 1; //increases by 1 per frame
  if (gameFrames%60 == 0) { //for every 60 frames, 1 second passes
    gameTime += 1;
  }
  textSize(20);
  fill(0);
  text("TIME ELAPSED: " + gameTime + " secs", 125, 30);
}


void gameClicks() {

//answer is correct or not----------------------------------------------------------------------------
  if (mouseX < x) { //guess true
    if (w == c) {
      score++;
    } else {
      mode = GAMEOVER; //mode switches to gameover
    }
  } else if (mouseX > x) { //guess false
    if (w == c) {
      mode = GAMEOVER;
    } else {
      score++;
    }
  }

//reset timer------------------------------------------------------------------------------------------
  wordSize = 1;
  timer = 199;

/*reset time elapsed counter---------------------------------------------------------------------------
  gameTime = 0; //Decided not to because it's cooler to see how long you've been playing, but here is the code if I want to reset it for every puzzle :D
  gameFrames = 0;
*/

//generate new puzzle----------------------------------------------------------------------------------
  chance();

//if pause button is pressed, mode switches to pause---------------------------------------------------
  if (dist(xp, yp, mouseX, mouseY) <= 50) {
    mode = PAUSE;
  }
}


void chance() { //function for 50-50 chance of matching puzzle or non-matching puzzle
  
  chance = int(random(0, 2)); //50-50 chance of 0 or 1
  
  if (chance == 0) { //if chance is 0, puzzle does not have to match
    w = int(random(0, 9)); 
    c = int(random(0, 9));
  } else if (chance == 1) { //if chance is 1, puzzle matches
    w = int(random(0,9));
    c = w;
  }
}
