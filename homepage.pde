// home page 

void homepage(){
  
  background(1);
  
  // show the video
  if(home_movie.available() == true){
    
    home_movie.read();
    home_movie.frameRate(60);
    imageMode(CORNER); 
    image(home_movie, 400, 0, 0.8*width, 1*height);
  } 
  
  
  textFont(myFont1);
  fill(254);
  textSize(90);
  text("Game of Life", 100-5, 250);
  
  textFont(myFont3);
  textSize(20);
  text("Originated by John Horton Conway", 100, 350-20);
  text("December 26, 1937 - April 11, 2020", 100, 380-20);
  
  
  // draw "Information" button 
  textFont(myFont2);
  if (mouseX>100 && mouseX<430 && mouseY > 500 && mouseY <570) {
    textSize(43);
  } else {
    textSize (38);
  }
  text("INFORMATION", 100, 550);
  
  // draw "Library" button 
  textFont(myFont2);
  if (mouseX>100 && mouseX<330 && mouseY > 700 && mouseY <770) {
    textSize(43);
  } else {
    textSize (38);
  }
  text("LIBRARY", 100, 750);
  
  
  // draw "start" button 
  textFont(myFont2);
  if (mouseX>100 && mouseX<330 && mouseY > 600 && mouseY <670) {
    textSize(55);
  } else {
    textSize(50);
  }
  text("START", 100, 655);
  
  
  // hover detection 

  
  
  
  
}
