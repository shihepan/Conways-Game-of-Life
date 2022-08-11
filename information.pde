void info() {
  
    background (220);  
    textFont(myFont5); 
    
    //textMode(CENTER); 
    fill(255,0,0);
    textSize(40); 
    text("Conway's Game of Life", width/2-280, 50);
    
    createInfoPage(); 
    

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
    textFont(myFont4); 
    text("BACK", (width-90), (height - 22)); 
  }
  
  
}





void createInfoPage(){ 
  
  textFont(myFont4); 
  fill(255,0,0);
  textSize(20); 
  text(" What is Conway's Game of Life?" , 50,130); 
  
  fill(0);
  textFont(myFont6);
  textSize(20); 
  text("Conway's Game of Life is a cellular automaton that is played on a 2D square grid. Each square (or cell) on the grid can be either alive or dead.", 608, 200, 1100, 100); 
  text("The initial configuration of cells can be created by a human, but all generations thereafter are completely determined by certain rules. The goal of the game is to find patterns that evolve in interesting ways – something that people have now been doing for over 50 years.", 608, 260, 1100, 100);

  
  textFont(myFont4); 
  fill(255,0,0);
  textSize(20); 
  text(" What is the rule?" , 50,330); 
  
  fill(0);
  textFont(myFont6);
  textSize(20); 
  text("There are lots of different rules, but the most classical one is the one created by Mr.Conway at the beginning:",55, 360);
  text(" --- Any live cell with fewer than two live neighbours dies (referred to as underpopulation).", 55,385+5); 
  text(" --- Any live cell with more than three live neighbours dies (referred to as overpopulation).", 55,410+10); 
  text(" --- Any live cell with two or three live neighbours lives, unchanged, to the next generation.", 55,435+15); 
  text(" --- Any dead cell with exactly three live neighbours comes to life.", 55,460+20); 
  

  textFont(myFont4); 
  fill(255,0,0);
  textSize(20); 
  text(" About this simulation" , 50,550); 
  
  fill(0);
  textFont(myFont6);
  textSize(20); 
  text("This program is a simulation (or you can consider it as a game) fully written in Processing, aiming to present Conway's Game of Life in an interactive, interesting and inspiring way.", 658, 625, 1200, 100);
  text("There are tons of simulation tools today, but this one has the following features:", 58, 650); 
  
  text("--- In Main Page, you can create whatever initial patterns you want easily by your mouse. You can change the color, speed and cell size easily by dragging the bars on the right. You can also click play, stop, next, clear to control the motion of patterns. More than that, there are also seven selected patterns that you can directly use. Try it! You will get a lot of fun!", 658, 730, 1200, 100);
  text("--- In Library, these interesting patterns are divided into three catagories: oscillator, spaceship and still life. You can change between them by clicking the triangle buttons. In each catagory, some typical patterns are shown on the right. This part enables you to better study on these patterns.", 658, 820, 1200, 100);
  
  text("(Source from https://conwaylife.com/. More infomation can be found there.)", 658, 910, 1200, 100);

  imageMode(CENTER);
  image(Conway, 1450-120,200,200,250); 
  
  text("John Horton Conway", 1350-120,350); 
  textSize(15); 
  text("(Source from https://www.princeton.edu/)", 1300-120, 370); 


}
