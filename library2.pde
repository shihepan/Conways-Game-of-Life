// Libraray -- Still Life Part

void library2() {
  
  background(200); 
  frameRate (60); 
 
  numCellX = (width -250) / 16; 
  numCellY = (height -100) / 16; 
  //print(numCellX, numCellY); 
  
  
  // draw cells 
  for (int x = 0; x < numCellX; x++){
    for (int y = 0; y < numCellY; y++) {
      drawCell2(x, y);   
    }
  }
  
  
  // create new live cells by mouse clicking
  if (mousePressed) { //create new live cells
    if (mouseX < width -250 && mouseY < height - 100){
      int xCellOver = int(map(mouseX, 0, width -250, 0, numCellX)); 
      xCellOver = constrain (xCellOver, 0, numCellX-1); 
      
      int yCellOver = int(map(mouseY, 0, height - 100, 0, numCellY)); 
      yCellOver = constrain (yCellOver, 0, numCellY-1); 
      
      
      // Check against cells in buffer 
      if (worldFuture[xCellOver+1][yCellOver+1]==true) { //cell is alife
        world [xCellOver+1] [yCellOver+1] = false; 
        fill (dead); // Fill with kill color 
      }
      else {// Cell is dead
        world [xCellOver+1] [yCellOver+1] = true; // Make alive 
        fill(alive); 
      }
    }
  }
  
  
  else if (!mousePressed) { // save to buffer once mouse goes up
    for (int x = 0; x < numCellX; x++) {
      for (int y = 0; y < numCellY; y++) {
        worldFuture[x][y] = world [x][y]; 
        
      }
    }
  }
  
  
  
  // clear/play/next funtion 
  if (clear) {
    frameRate(60);
    exist = 0; 
  }
  else if (play) {
    frameRate(5);
    iteration2 ();    // function 2 ---  interation 
    gen ++; 
  }
  else if (next) {
    frameRate(60);
    iteration2();
    gen ++; 
    noLoop();
  }
    
  drawButtons2(); 
  pushStyle(); 
  //drawColorBar1(); 
  popStyle(); 
  //drawSpeedBar1(); 
  pushStyle(); 
  drawGeneration2(); 
  popStyle();
  //drawSizeBar1(); 
  pushStyle(); 

  
  println(); 
  
  
  // draw the line 
  fill(255,22,0); 
  stroke(18); 
  line(width - 250, 120, width - 10, 120); 
  //line(width - 250, 780, width - 10, 780); 
  
  //text
  textFont(myFont4); 
  fill(122,254,0);
  textSize(40); 
  text("Still Life", 110, height - 38); 
  
  
  textFont(myFont3); 
  textSize(20); 
  fill(0);
  text("A still life (or stable pattern) is a pattern that does not change from one generation to the next. The two main subgroups of still lifes are strict still lifes and pseudo still lifes. More interesting patterns can be found at https://conwaylife.com/wiki/Still_life. ", 950-120,height-42,800,100); 
  
  
  if (mousePressed && mouseX >55 && mouseX <80 && mouseY >835 && mouseY < 865-5) {
    fill(122,254,0);
  } else {
    fill(0); 
  }
  
  noStroke();
  triangle(55, 850-3, 80, 835-3, 80, 865-3);
  
  if (mousePressed && mouseX >80+250+3 && mouseX <55+250+50+3 && mouseY >835 && mouseY < 865-5) {
    fill(122,254,0);
  } else {
    fill(0); 
  }
  
  triangle(55+250+50+3, 850-3, 80+250+3, 835-3, 80+250+3, 865-3);

}






// drawCell funtion 
void drawCell2(int x, int y) { 
  stroke(70); 
  if (world[x][y]) {
    fill (alive); 
  }
  
  else {
    fill(dead);
  }
  rect (x*16, y*16, 16, 16); 
  
 
  
}


// iteration function 
void iteration2() {
  
  // let worldfuture become world first 
  for (int x=0; x < numCellX; x++) {
    for (int y=0; y < numCellY; y++) {
      worldFuture [x][y] = world[x][y]; 
    }
  }
  
  
  
  for (int x=0; x < numCellX; x++) {
    for (int y=0; y < numCellY; y++) {
      
    // count the number of neighbours  
      int neighbours = 0;  // the number of neighbors 
      for (int xx = x-1 ; xx <= x+1; xx++) { 
        for (int yy = y-1 ; yy <= y+1; yy++) { 
          if (((xx >= 0) && (xx < numCellX)) && ((yy >= 0) && (yy < numCellY))) {
            if (!((xx==x) && (yy == y))) {
              if (worldFuture [xx][yy] == true) {
                neighbours ++;   // counting neighbours 
              }
            }
          }
        }
      }  
      
      // apply rules 
      if (worldFuture [x][y] == true) {
        if (neighbours < 2 || neighbours > 3) {
          world [x][y] = false; 
        }
      }
      
      else if (neighbours == 3) {
        world [x][y] = true; 
      }
   
    }
  }
 
}






void drawButtons2() {
  
  textFont(myFont4); 

  // "PLAY" botton 
  pushStyle(); 
  if (mousePressed && mouseX > (width-235) && mouseX < (width -135) && mouseY >25 && mouseY <55) {
    fill (255, 0, 0); 
  }
  else {
    fill(0); 
  }
  
  {
    stroke(255,0,0); 
    rectMode(CENTER); 
    rect((width -185), 40, 100, 30); 
    fill (255); 
    // textFont(f); 
    textSize (20); 
    text("PLAY", (width-215), 50-2); 
  }
  popStyle(); 
  
  
  // "CLEAR" botton 
  pushStyle(); 
  
  if (mousePressed && mouseX > (width-120) && mouseX < (width -20) && mouseY >25 && mouseY <55) {
    fill (255, 0, 0); 
  }
  else {
    fill(0); 
  }
  
  {
    stroke(255,0,0); 
    rectMode(CENTER); 
    rect((width -70), 40, 100, 30); 
    fill (255); 
    // textFont(f); 
    textSize (20); 
    text("CLEAR", (width-105), 50-2); 
  }
  popStyle();
  
  
  // "STOP" button 
  pushStyle();
  if (mousePressed && mouseX > (width-235) && mouseX < (width -135) && mouseY >75 && mouseY <105) {
    fill (255, 0, 0); 
  }
  else {
    fill(0); 
  }
  
  {
    stroke(255,0,0); 
    rectMode(CENTER); 
    rect((width -185), 90, 100, 30); 
    fill (255); 
    // textFont(f); 
    textSize (20); 
    text("STOP", (width-215), 100-2); 
  }
  popStyle(); 
  
  
  
  // "Next" Button
  pushStyle();
  if (mousePressed && mouseX > (width-120) && mouseX < (width -20) && mouseY >75 && mouseY <105) {
    fill (255, 0, 0); 
  }
  else {
    fill(0); 
  }
  
  {
    stroke(255,0,0); 
    rectMode(CENTER); 
    rect((width -70), 90, 100, 30);  
    fill (255); 
    // textFont(f); 
    textSize (20); 
    text("NEXT", (width-100), 100-1); 
  }
  popStyle(); 
  
  


// paterns //

  textFont(myFont3); 
  // "Blinker" button 
  pushStyle(); 
  
  { imageMode(CENTER); 
    image(S_1, (width -185), 180, 90, 90);
    fill (0); 
    // textFont(f3); 
    textMode(CENTER); 
    textSize(18); 
    text("Block", (width-207), 242); 
  }
  
  

  popStyle(); 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    imageMode(CENTER); 
    image(S_2, (width -70), 180, 90, 90);
    fill (0); 
    textMode(CENTER);
    textSize(18); 
    text("Tube", (width-95), 242); 
  }
  

  
  // "Mazing" botten 
  popStyle(); 
  pushStyle(); 
  
  { imageMode(CENTER); 
    image(S_3, (width -185), 180+130, 90, 90);
    fill (0); 
    textMode(CENTER);
    textSize(18);  
    text("Boat", (width-210), 370); 
  }
  
  

  popStyle(); 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    imageMode(CENTER); 
    image(S_4, (width -70), 310, 90, 90);
    fill (0); 
    textSize(18); 
    textMode(CENTER);
    text("Beehive", (width-105), 370); 
  }
  
  
  popStyle(); 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    imageMode(CENTER); 
    image(S_5, (width -185), 310+130, 90, 90);
    fill (0); 
    textSize(17); 
    textMode(CENTER);
    text("Loaf", (width-210), 500); 
  }
  
  
  popStyle(); 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    imageMode(CENTER); 
    image(S_6, (width -70), 440, 90, 90);
    fill (0); 
    textSize(18); 
    textMode(CENTER);
    text("Elevener", (width-98), 500); 
  }
  
  

  popStyle(); 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    imageMode(CENTER); 
    image(S_7, (width -185), 440+130, 90, 90);
    fill (0); 
    textSize(17); 
    textMode(CENTER);
    text("Canoe", (width-207), 633); 
  }
   
   

  //popStyle(); 
  //pushStyle(); 
  
  //{
  //  fill(0,0,255,100); 
  //  stroke(0,255,0); 
  //  imageMode(CENTER); 
  //  image(O_8, (width -70), 440+130, 90, 90);
  //  fill (0); 
  //  textSize(18); 
  //  textMode(CENTER);
  //  text("Figure eight", (width-110), 633); 
  //}
   
   
   
  //popStyle(); 
  //pushStyle(); 
  
  //{
  //  fill(0,0,255,100); 
  //  stroke(0,255,0); 
  //  imageMode(CENTER); 
  //  image(O_9, (width -185), 440+130*2, 90, 90);
  //  fill (0); 
  //  // textFont(f3); 
  //  textSize(15); 
  //  textMode(CENTER);
  //  text("Pentadecathlon", (width-232), 760); 
  //}
  
  

  //popStyle(); 
  //pushStyle(); 
  
  //{
  //  fill(0,0,255,100); 
  //  stroke(0,255,0); 
  //  imageMode(CENTER); 
  //  image(O_10, (width -70), 440+130*2, 90, 90);
  //  fill (0); 
  //  // textFont(f3); 
  //  textSize(14); 
  //  textMode(CENTER);
  //  text("queen bee shuttle", (width-120), 760); 
  //}
  
  //  popStyle(); 
  //  pushStyle(); 
    

  
  // return Botton 
  if (mousePressed && mouseX > (width-110) && mouseX < (width -10) && mouseY >(height - 50) && mouseY < (height - 10)) {
    fill (255, 0, 0); 
  }
  else {
    fill(0); 
  }
  
  {
    stroke(255,0,0); 
    rectMode(CENTER); 
    rect((width - 60), (height - 30), 100, 40); 
    fill (255); 
    textFont(myFont4); 
    textSize (20); 
    text("BACK", (width-91), (height - 23)); 
  }
    
}




void drawGeneration2() {

  fill(0); 

  // display generation 
  
  textSize(17); 
  text("Generation: " + gen, width-190, 820, 0); 
}
