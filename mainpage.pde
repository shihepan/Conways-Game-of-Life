// main page


void mainpage() {
  
  background(200); 
  frameRate (60); 
  
  textFont(myFont4); 

  numCellX = (width -250 ) / cellSize; 
  numCellY = height / cellSize; 
  //println(numCellX);
  
  //world = new boolean [numCellX] [numCellY]; 
  //worldFuture = new boolean [numCellX] [numCellY];
  
  
  
  // draw cells 
  for (int x = 0; x < numCellX; x++){
    for (int y = 0; y < numCellY; y++) {
      drawCell(x, y);   // function 1 ---- draw cell
    }
  }
  
  
  // create new live cells by mouse clicking
  if (mousePressed) { //create new live cells

    if (mouseX < width -250){
      int xCellOver = int(map(mouseX, 0, width -250, 0, numCellX)); 
      xCellOver = constrain (xCellOver, 0, numCellX-1); 
      
      int yCellOver = int(map(mouseY, 0, height, 0, numCellY)); 
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
  
  
  
  
  
  // clear and play funtion 
  if (clear) {
    frameRate(60);
    exist = 0; 
  }
  else if (play) {
    frameRate(speed);
    iteration ();    // function 2 ---  interation 
    gen ++; 
  }
  else if (next) {
    //frameRate(60);
    iteration();
    gen ++; 
    noLoop();
  }
    
  drawButtons(); 
  pushStyle(); 
  drawColorBar(); 
  popStyle(); 
  drawSpeedBar(); 
  pushStyle(); 
  drawSphere(); 
  popStyle();
  drawSizeBar(); 
  pushStyle(); 
  
  //count(); 
  
  
  println(); 
}


// begin to code on funtions above: 

void count(){
   
  for (int a=0; a < numCellX; a++) {
    for (int b=0; b < numCellY; b++) {
      
      if (world[a][b] == true) {
        if (worldFuture[a][b] != world[a][b]) {
          exist = exist +1;
          //worldFuture[a][b] = world[a][b];
        }
      }
    } 
  }
}


// drawCell funtion 
void drawCell(int x, int y) { 
  stroke(70); 
  if (world[x][y]) {
    fill (alive); 
  }
  
  else {
    fill(dead);
  }
  rect (x*cellSize, y*cellSize, cellSize, cellSize); 
  
  //if (world[x][y] == true) {
  //      exist = exist +1;
  //    }
  
}


// iteration function 
void iteration() {
  
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






void drawButtons() {

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
    text("PLAY", (width-215), 50-3); 
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
    text("CLEAR", (width-105), 50-3); 
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
    rect((width -70), 90, 100, 30-2);  
    fill (255); 
    // textFont(f); 
    textSize (20); 
    text("NEXT", (width-100), 100-2); 
  }
  popStyle(); 
  
  
// patterns // 


  // "Butterfly" button 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    rectMode(CENTER); 
    rect((width -130), 340, 150, 40); 
    fill (255); 
    textSize(18); 
    text("Butterfly", (width-167), 345); 
  }
  
  
  // "Frog" button 
  popStyle(); 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    rectMode(CENTER); 
    rect((width -130), 400, 150, 40); 
    fill (255); 
    textSize(18); 
    text("Frog", (width-150), 405); 
  }
  
  // "gun" botten 
  popStyle(); 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    rectMode(CENTER); 
    rect((width -130), 460, 150, 40); 
    fill (255); 
    // textFont(f3); 
    textSize(18); 
    text("Gun", (width-146), 465); 
  }
  
  
  // "Star" botton 
  popStyle(); 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    rectMode(CENTER); 
    rect((width -130), 520, 150, 40);  
    fill (255); 
    textSize(18); 
    text("Star", (width-148), 525); 
  }
  
  
  
  // "flower" botten 
  popStyle(); 
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    rectMode(CENTER); 
    rect((width -130), 580, 150, 40); 
    fill (255); 
    // textFont(f3); 
    textSize(18); 
    text("Flower", (width-158), 585); 
  }
  popStyle(); 
  
  
  // "Rocket" botten 
  
  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    rectMode(CENTER); 
    rect((width -130), 580+60, 150, 40); 
    fill (255); 
    // textFont(f3); 
    textSize(18); 
    text("Rocket", (width-160), 646); 
  }
  popStyle(); 
  
  
  // "shuttle" botten 

  pushStyle(); 
  
  {
    fill(0,0,255,100); 
    stroke(0,255,0); 
    rectMode(CENTER); 
    rect((width -130), 580+60*2, 150, 40); 
    fill (255); 
    // textFont(f3); 
    textSize(18); 
    text("Shuttle", (width-160), 706); 
  }
  popStyle(); 
  
  
  
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
    // textFont(f); 
    textSize (20); 
    text("BACK", (width-90), (height - 22)); 
  }
    
}



 
void drawSpeedBar () {
  pushStyle(); 
  {
    stroke(255,0,0); 
    strokeWeight(4); 
    
    line((width -225), 150, (width -25), 150); 
    fill(255); 
    //textFont (f1); 
    textSize(15); 
    fill(0);
    text("SPEED", (width -155), 130); 
    //text("PATTERNS", (width -210), 310); 
    fill(0); 
    textSize(30); 
    //text("-", (width -242), 165); 
    //text("+", (width -30), 165); 
  }
  popStyle(); 
  pushStyle(); 
  {// speed handle
    fill (255, 0,0); 
    stroke(255); 
    strokeWeight(1); 
    rectMode(CENTER); 
    speedHandleX = map(speed, 1, 30, (width -225), (width -30)); 
    rect(speedHandleX, 150, 20, 20); 
    
  }
  popStyle();  
 
}


    

void drawColorBar() {
  
  stroke(alive); 
  strokeWeight(4); 
  fill(alive); 
  line((width-225),200,(width-30),200); 
  
  //color handle 
  stroke(255); 
  strokeWeight(1); 
  rectMode(CENTER); 
  colorHandleX = map(alive, #FF0303,#1603FF, (width-225),(width-30)); 
  rect(colorHandleX,200,20,20); 
  textSize(15); 
  fill(alive); 
  text("COLOR",(width-155), 180); 
}



void drawSizeBar() {
  
  stroke(0,0,255); 
  strokeWeight(4); 
  fill(0,0,255); 
  line((width-225),250,(width-30),250); 
  
  //color handle 
  stroke(255); 
  strokeWeight(1); 
  rectMode(CENTER); 
  sizeHandleX = int (map(cellSize, 8, 22, (width-225),(width-30))); 
  rect(sizeHandleX,250,20,20); 
  textSize(15); 
  //fill(254); 
  fill(0);
  text("Cell Size",(width-155), 230); 
}
  



void drawSphere() {
  
  //background(0); 
  //pushMatrix(); 
  
  fill(0); 
  //translate(width - 75, 620, 0); 
  //stroke(alive); 
  //rotateY (radians(sphereRot)); 
  //directionalLight (0,0,0,10,10,0); 
  //sphere (40); 
  //if (play) {
  //  sphereRot = sphereRot - speed; 
  //}
  
  // display generation 
  
  //textFont(f2);
  textSize(18); 
  text("Generation: " + gen, width-190, 820, 0); 
  //text("Exist: " + exist, width-240, 700, 0); 
}
