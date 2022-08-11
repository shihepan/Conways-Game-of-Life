import processing.video.*;

boolean startpage = true, homepage = false, mainpage = false, library = false, info = false, library2 = false, library3 = false;  

boolean pattern1 = false, pattern2 = false, pattern3 = false, pattern4 = false;

Movie start_movie;
Movie home_movie;
//PImage image; 
PFont myFont1; 
PFont myFont2;
PFont myFont3; 
PFont myFont4;
PFont myFont5;
PFont myFont6;



PImage O_1, O_2, O_3, O_4, O_5, O_6, O_7, O_8, O_9, O_10;   // oscilator 
PImage S_1, S_2, S_3, S_4, S_5, S_6, S_7, S_8, S_9, S_10;    // still life
PImage SS_1, SS_2, SS_3, SS_4, SS_5, SS_6, SS_7, SS_8, SS_9, SS_10;  // spaceship 
PImage Conway; 




// parameters for main page 
int cellSize = 8; 

// number of cells
int numCellX; 
int numCellY; 

// world 
boolean[][] world; 
boolean[][] worldFuture; 

// coler of dead/alive cells 
color alive = color(40,255,16); 
color dead = color (0); 

// play 
boolean play; 
boolean clear; 
boolean next; 

// frameRate 
float speed = 10; 

// font
PFont f, f1, f2, f3; 
float sphereRot = 0; 

// number of generations
int gen; 
int exist; 

float speedHandleX; 
float colorHandleX;
float sizeHandleX;
boolean dragging = false; 
boolean dragging2 = false; 
boolean dragging3 = false; 






void setup(){
  size(1500, 900);
  background(0);
  
  // load movie and the first frame 
  start_movie = new Movie(this, "starting page.mp4");
  home_movie = new Movie (this, "home page.mp4");
  
  start_movie.play(); 
  home_movie.loop();

  
  // load images 
  O_1 = loadImage("blinker.png"); 
  O_2 = loadImage("caterer.png"); 
  O_3 = loadImage("mazing.png"); 
  O_4 = loadImage("Pseudo-barberpole.png"); 
  O_5 = loadImage("rob's p16.png"); 
  O_6 = loadImage("tumbler.png"); 
  O_7 = loadImage("24P10.png"); 
  O_8 = loadImage("Figure eight.png"); 
  O_9 = loadImage("pentadecathlon.png"); 
  O_10 = loadImage("queen bee shuttle.png"); 
  
  S_1 = loadImage("Block.png"); 
  S_2 = loadImage("tube.png"); 
  S_3 = loadImage("boat.png"); 
  S_4 = loadImage("beehive.png"); 
  S_5 = loadImage("loaf.png"); 
  S_6 = loadImage("elevener.png"); 
  S_7 = loadImage("canoe.png"); 
  //S_8 = loadImage(".png"); 
  //S_9 = loadImage(".png"); 
  //S_10 = loadImage(".png"); 
  
  
  SS_1 = loadImage("glider.png"); 
  SS_2 = loadImage("spaceship.png"); 
  SS_3 = loadImage("coe ship.png"); 
  SS_4 = loadImage("slidewinder.png"); 
  SS_5 = loadImage("35P12H6V0.png"); 
  SS_6 = loadImage("copperhead.png"); 
  SS_7 = loadImage("loafer.png"); 
  //SS_8 = loadImage(".png"); 
  //SS_9 = loadImage(".png"); 
  //SS_10 = loadImage(".png"); 
  
  Conway = loadImage("conway.jpg"); 
  
  numCellX = (width - 250) / cellSize; 
  numCellY = height / cellSize; 
  
  world = new boolean [numCellX] [numCellY]; 
  worldFuture = new boolean [numCellX] [numCellY];
  
  
  
  // set fonts
  myFont1 = loadFont("Algerian-60.vlw");
  myFont2 = createFont("Nosifer.ttf",60);
  myFont3 = loadFont("Calibri-20.vlw");
  myFont4 = loadFont("Arial-Black-20.vlw");
  myFont5 = loadFont("Arial-Black-40.vlw");
  myFont6 = loadFont("ArialRoundedMTBold-20.vlw");

  
  // set the inital conditions for world ---- "false"
  for (int x = 0; x < numCellX; x++) {
    for (int y = 0; y < numCellY; y++) {
      world[x][y] = false; 
    }
  }
  
  stroke(0); 
  smooth(); 
  
  // set the initial condition for "play" and "clear" 
  play = false; 
  clear = false; 
  
  // generation starting at 0
  gen = 0;  
 
}




void draw(){
  
  if (startpage==true) {
    startpage();
  }
  
  if (homepage==true) {
    homepage(); 
  }
  if (mainpage==true) {
    mainpage();
  }
  if (library==true) {
    library();
  }
  if (info == true) {
    info(); 
  }
  
  if (library2 == true) {
    library2();
  }
  
  if (library3 == true) {
    library3(); 
  }
}




void mouseClicked() {
  
  if (startpage==true){
    background(0);
    startpage=false; 
    homepage=true; 
    mainpage=false;
   }
   
   
   
   
   else if (homepage==true){
     // go to main page 
     if (mouseX>100 && mouseX<330 && mouseY>600 && mouseY<670) {
       startpage = false; 
       homepage = false; 
       mainpage = true;
     }
     // go to library
     if (mouseX>100 && mouseX<300 && mouseY>725 && mouseY<775) {
       startpage = false; 
       homepage = false; 
       mainpage = false;
       library = true;
     }
     
     // go to information 
     if (mouseX>100 && mouseX<430 && mouseY > 500 && mouseY <570) {
       startpage = false; 
       homepage = false; 
       mainpage = false;
       library = false;
       info = true;
     }
   }
   
   
   
   
   else if (mainpage){
     
      // Press PLAY 
      //frameRate(144);
      if (mouseX > (width-235) && mouseX < (width-135) && mouseY >25 && mouseY <55) {
        play = true ;
        clear = false;
        loop(); 
      }
    
      // Press CLEAR
      if (mouseX > (width-120) && mouseX < (width-20) && mouseY >25 && mouseY <55) {
        for (int x = 0; x < numCellX; x++) {
          for (int y = 0; y < numCellY; y++) {
            world [x][y] = false; 
            clear = true; 
            play = false; 
            gen = 0; 
            loop(); 
          }
        }
      }
  
      // Press STOP 
      //frameRate(144);
      if (mouseX > (width-235) && mouseX < (width-135) && mouseY >75 && mouseY <105) {
        noLoop(); 
        play = false; 
        if (!mousePressed) {
          loop(); 
        }
      }
     
     // Press NEXT
     if (mouseX > (width-120) && mouseX < (width-20) && mouseY >75 && mouseY <105) {
       
       //play = false; 
       //clear = false;
       next = true; 
       //play = false; 
       //clear = false; 
       loop();
      }
     
     
     // Press return 
     if (mouseX > (width-110) && mouseX < (width -10) && mouseY >(height - 50) && mouseY < (height - 10)) {
         background(0);
         mainpage = false; 
         homepage = true; 
         startpage = false;
       }
       
       
      if (mouseX > ((width -130)-75) && mouseX < ((width -130)+75) && mouseY > 340-20 && mouseY < 340+20) {
        pattern_M1(); 
      }
      
      
      if (mouseX > ((width -130)-75) && mouseX < ((width -130)+75) && mouseY > 340-20+60 && mouseY < 340+20+60) {
        pattern_M2(); 
      }
      
      if (mouseX > ((width -130)-75) && mouseX < ((width -130)+75) && mouseY > 340-20+60*2 && mouseY < 340+20+60*2) {
        pattern_M3(); 
      }
      
      if (mouseX > ((width -130)-75) && mouseX < ((width -130)+75) && mouseY > 340-20+60*3 && mouseY < 340+20+60*3) {
        pattern_M4(); 
      }
      
      if (mouseX > ((width -130)-75) && mouseX < ((width -130)+75) && mouseY > 340-20+60*4 && mouseY < 340+20+60*4) {
        pattern_M5(); 
      }
      
      if (mouseX > ((width -130)-75) && mouseX < ((width -130)+75) && mouseY > 340-20+60*5 && mouseY < 340+20+60*5) {
        pattern_M6(); 
      }
      
      if (mouseX > ((width -130)-75) && mouseX < ((width -130)+75) && mouseY > 340-20+60*6 && mouseY < 340+20+60*6) {
        pattern_M7(); 
      }
      

       
   }
   
   
   
   
   else if (library) {
       // Press PLAY 
      //frameRate(144);
      if (mouseX > (width-235) && mouseX < (width-135) && mouseY >25 && mouseY <55) {
        play = true ;
        clear = false;
        loop(); 
      }
    
      // Press CLEAR
      if (mouseX > (width-120) && mouseX < (width-20) && mouseY >25 && mouseY <55) {
        for (int x = 0; x < numCellX; x++) {
          for (int y = 0; y < numCellY; y++) {
            world [x][y] = false; 
            clear = true; 
            play = false; 
            gen = 0; 
            loop(); 
          }
        }
      }
  
      // Press STOP 
      //frameRate(144);
      if (mouseX > (width-235) && mouseX < (width-135) && mouseY >75 && mouseY <105) {
        noLoop(); 
        play = false; 
        if (!mousePressed) {
          loop(); 
        }
      }
     
     // Press NEXT
     if (mouseX > (width-120) && mouseX < (width-20) && mouseY >75 && mouseY <105) {
       
       play = false; 
       clear = false;
       next = true; 
       //play = false; 
       //clear = false; 
       loop();
      }
     
     
     // Press return 
     if (mouseX > (width-110) && mouseX < (width -10) && mouseY >(height - 50) && mouseY < (height - 10)) {
         background(0);
         library = false; 
         homepage = true; 
         startpage = false;
       }
       
       
      // change page to another library
      if (mouseX > 55 && mouseX < 80 && mouseY >835 && mouseY < 860) {
         background(0);
         library = false; 
         library2 = true; 
         library3 = false; 
       }
       
       if (mouseX > 80+250+3 && mouseX < 55+250+50+3 && mouseY >835 && mouseY < 860) {
         background(0);
         library = false; 
         library3 = true; 
         library2 = false; 
       }
       
      
       
       
     if (mouseX>(width -230) && mouseX < (width-140) && mouseY > 180-45 && mouseY <180+45) {
        pattern_O1();
     }
     
     
     if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 180-45 && mouseY <180+45) {
        pattern_O2(); 
     }
     
     
     if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 310-45 && mouseY <310+45) {
      pattern_O3(); 
   }
   
   
   if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 310-45 && mouseY <310+45) {
      pattern_O4(); 
   }
   
   
   if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 440-45 && mouseY <440+45) {
     pattern_O5(); 
   }
   
   if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 440-45 && mouseY <440+45) {
      pattern_O6(); 

   }
   
   
   if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 570-45 && mouseY <570+45) {
      pattern_O7(); 

   }
   
   if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 570-45 && mouseY <570+45) {
      pattern_O8(); 

   }
   
   if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 700-45 && mouseY <700+45) {
      pattern_O9(); 

   }
   
   if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 700-45 && mouseY <700+45) {
      pattern_O10(); 

   }

  } 
  
  
  
  
  else if (library2) {
       // Press PLAY 
      //frameRate(144);
      if (mouseX > (width-235) && mouseX < (width-135) && mouseY >25 && mouseY <55) {
        play = true ;
        clear = false;
        loop(); 
      }
    
      // Press CLEAR
      if (mouseX > (width-120) && mouseX < (width-20) && mouseY >25 && mouseY <55) {
        for (int x = 0; x < numCellX; x++) {
          for (int y = 0; y < numCellY; y++) {
            world [x][y] = false; 
            clear = true; 
            play = false; 
            gen = 0; 
            loop(); 
          }
        }
      }
  
      // Press STOP 
      //frameRate(144);
      if (mouseX > (width-235) && mouseX < (width-135) && mouseY >75 && mouseY <105) {
        noLoop(); 
        play = false; 
        if (!mousePressed) {
          loop(); 
        }
      }
     
     // Press NEXT
     if (mouseX > (width-120) && mouseX < (width-20) && mouseY >75 && mouseY <105) {
       
       play = false; 
       clear = false;
       next = true; 
       //play = false; 
       //clear = false; 
       loop();
      }
     
     
     // Press return 
     if (mouseX > (width-110) && mouseX < (width -10) && mouseY >(height - 50) && mouseY < (height - 10)) {
         background(0);
         library2 = false; 
         homepage = true; 
         startpage = false;
       }
       
       
      // change page to another library
      if (mouseX > 55 && mouseX < 80 && mouseY >835 && mouseY < 860) {
         background(0);
         library2 = false; 
         library3 = true; 
       }
       
       if (mouseX > 80+250+3 && mouseX < 55+250+50+3 && mouseY >835 && mouseY < 860) {
         background(0);
         library2 = false; 
         library = true; 
       }
       
      
       
       
     if (mouseX>(width -230) && mouseX < (width-140) && mouseY > 180-45 && mouseY <180+45) {
        pattern_S1();
     }
     
     
     if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 180-45 && mouseY <180+45) {
        pattern_S2(); 
     }
     
     
     if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 310-45 && mouseY <310+45) {
      pattern_S3(); 
   }
   
   
   if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 310-45 && mouseY <310+45) {
      pattern_S4(); 
   }
   
   
   if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 440-45 && mouseY <440+45) {
     pattern_S5(); 
   }
   
   if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 440-45 && mouseY <440+45) {
      pattern_S6(); 

   }
   
   
   if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 570-45 && mouseY <570+45) {
      pattern_S7(); 

   }
   
   //if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 570-45 && mouseY <570+45) {
   //   pattern_O8(); 

   //}
   
   //if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 700-45 && mouseY <700+45) {
   //   pattern_O9(); 

   //}
   
   //if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 700-45 && mouseY <700+45) {
   //   pattern_O10(); 

   //}

  } 
  
  
  
  
  
  else if (library3) {
       // Press PLAY 
      //frameRate(144);
      if (mouseX > (width-235) && mouseX < (width-135) && mouseY >25 && mouseY <55) {
        play = true ;
        clear = false;
        loop(); 
      }
    
      // Press CLEAR
      if (mouseX > (width-120) && mouseX < (width-20) && mouseY >25 && mouseY <55) {
        for (int x = 0; x < numCellX; x++) {
          for (int y = 0; y < numCellY; y++) {
            world [x][y] = false; 
            clear = true; 
            play = false; 
            gen = 0; 
            loop(); 
          }
        }
      }
  
      // Press STOP 
      //frameRate(144);
      if (mouseX > (width-235) && mouseX < (width-135) && mouseY >75 && mouseY <105) {
        noLoop(); 
        play = false; 
        if (!mousePressed) {
          loop(); 
        }
      }
     
     // Press NEXT
     if (mouseX > (width-120) && mouseX < (width-20) && mouseY >75 && mouseY <105) {
       
       play = false; 
       clear = false;
       next = true; 
       //play = false; 
       //clear = false; 
       loop();
      }
     
     
     // Press return 
     if (mouseX > (width-110) && mouseX < (width -10) && mouseY >(height - 50) && mouseY < (height - 10)) {
         background(0);
         library3 = false; 
         homepage = true; 
         startpage = false;
       }
       
       
      // change page to another library
      if (mouseX > 55 && mouseX < 80 && mouseY >835 && mouseY < 860) {
         background(0);
         library3 = false; 
         library = true; 
       }
       
       if (mouseX > 80+250+3 && mouseX < 55+250+50+3 && mouseY >835 && mouseY < 860) {
         background(0);
         library3 = false; 
         library2 = true; 
       }
       
      
       
       
     if (mouseX>(width -230) && mouseX < (width-140) && mouseY > 180-45 && mouseY <180+45) {
        pattern_SS1();
     }
     
     
     if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 180-45 && mouseY <180+45) {
        pattern_SS2(); 
     }
     
     
     if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 310-45 && mouseY <310+45) {
      pattern_SS3(); 
   }
   
   
   if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 310-45 && mouseY <310+45) {
      pattern_SS4(); 
   }
   
   
   if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 440-45 && mouseY <440+45) {
     pattern_SS5(); 
   }
   
   if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 440-45 && mouseY <440+45) {
      pattern_SS6(); 

   }
   
   
   if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 570-45 && mouseY <570+45) {
      pattern_SS7(); 

   }
   
   //if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 570-45 && mouseY <570+45) {
   //   pattern_SS8(); 

   //}
   
   //if (mouseX>(width -185-45) && mouseX < (width-185+45) && mouseY > 700-45 && mouseY <700+45) {
   //   pattern_SS9(); 

   //}
   
   //if (mouseX>(width -70-45) && mouseX < (width-70+45) && mouseY > 700-45 && mouseY <700+45) {
   //   pattern_SS10(); 

   //}

  } 
  
  
  
  
  
  
  
  
  
  
  
  
  else if (info) {
    // Press return 
     if (mouseX > (width-110) && mouseX < (width -10) && mouseY >(height - 50) && mouseY < (height - 10)) {
         background(0);
         mainpage = false; 
         homepage = true; 
         startpage = false;
         info = false; 
       }
    
  }
   
}
 
 

 
void mouseDragged() {
  if (mainpage){
 
  float x = constrain (mouseX, (width -225), (width -20)); 
  if (mouseY > 140 && mouseY < 160 && mouseX > speedHandleX - 10 && mouseX < speedHandleX +10) {
    dragging = true; 
  }
  if (mouseY > 190 && mouseY < 210 && mouseX > colorHandleX - 10 && mouseX < colorHandleX +10) {
    dragging2 = true; 
  }
  if (mouseY > 240 && mouseY < 260 && mouseX > sizeHandleX - 10 && mouseX < sizeHandleX +10) {
    dragging3 = true; 
  }
  if (dragging3) {
    cellSize = int (map(x, (width - 225) -10, (width - 30) +10, 8, 22)); 
  }
  if (dragging2) {
    alive = int (map(x, (width - 225) -10, (width - 30) +10, #FF0303, #1603FF)); 
  }
  if (dragging) {
    speed = map (x, (width - 225) -10, (width -30) + 10, 1, 30); 
  } 
 }
}








void mousePressed() {
  if (mainpage) {
    
    //if (mouseX > ((width -130)-75) && mouseX < ((width -130)+75) && mouseY > 340-20 && mouseY < 340+20) {
    //    pattern1 = true; 
    //  }
    
    
  }
}





void mouseReleased() {
  if (mainpage) {
  dragging = false; 
  dragging2 = false; 
  dragging3 = false;
  
    //if (pattern1) {
      
    //  int x = mouseX; 
    //  int y = mouseY; 
    //   world[x][y] = true; 
    //   world[x+1][y] = true; 
    //   world[x+2][y] = true; 
    //}
  }
}











void pattern_O1(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x][y] = true; 
  world[x+1][y] = true; 
  world[x+2][y] = true; 
  
}


void pattern_O2(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
      
      world[x][y+1] = true; 
      world[x][y+2] = true; 
      world[x][y+3] = true; 
      world[x+1][y+5] = true; 
      world[x+2][y] = true; 
      world[x+2][y+5] = true; 
      world[x+3][y+4] = true; 
      world[x+4][y+1] = true; 
      world[x+4][y+2] = true; 
      world[x+5][y+1] = true; 
      world[x+6][y+1] = true; 
      world[x+7][y+1] = true; 
  
}


void pattern_O3(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
      world[x][y+2] = true; 
      world[x+1][y+1] = true; 
      world[x+1][y+3] = true; 
      world[x+3][y] = true; 
      world[x+3][y+1] = true;
      world[x+3][y+5] = true;
      world[x+4][y] = true; 
      world[x+4][y+6] = true; 
      world[x+5][y+3] = true; 
      world[x+5][y+5] = true; 
      world[x+6][y+2] = true; 
      world[x+6][y+3] = true;  
  
}


void pattern_O4(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
      world[x+1][y+11] = true; 
      world[x+1][y+12] = true; 
      world[x+2][y+9] = true; 
      world[x+2][y+12] = true; 
      world[x+3][y+9] = true; 
      world[x+3][y+11] = true; 
      world[x+5][y+7] = true; 
      world[x+5][y+9] = true; 
      world[x+7][y+5] = true; 
      world[x+7][y+7] = true; 
      world[x+9][y+2] = true; 
      world[x+9][y+3] = true; 
      world[x+9][y+5] = true; 
      world[x+11][y+1] = true; 
      world[x+11][y+3] = true; 
      world[x+12][y+1] = true; 
      world[x+12][y+2] = true; 
  
}


void pattern_O5(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  world[x+1][y+4] = true; 
      world[x+2][y+4] = true; 
      world[x+2][y+6] = true; 
      world[x+2][y+7] = true; 
      world[x+3][y+4] = true; 
      world[x+3][y+8] = true; 
      world[x+3][y+9] = true; 
      world[x+5][y+5] = true; 
      world[x+5][y+6] = true; 
      world[x+5][y+10] = true; 
      world[x+6][y+2] = true; 
      world[x+6][y+4] = true; 
      world[x+6][y+5] = true; 
      world[x+6][y+6] = true; 
      world[x+7][y+1] = true; 
      world[x+7][y+3] = true; 
      world[x+7][y+4] = true; 
      world[x+7][y+8] = true; 
      world[x+7][y+9] = true; 
      world[x+7][y+10] = true; 
      world[x+8][y+2] = true; 
      world[x+8][y+4] = true; 
      world[x+8][y+9] = true; 
      world[x+8][y+10] = true; 
  
}


void pattern_O6(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+5] = true; 
      world[x+2][y+5] = true; 
      world[x+2][y+6] = true; 
      world[x+3][y+1] = true; 
      world[x+3][y+6] = true; 
      world[x+4][y+1] = true; 
      world[x+4][y+3] = true; 
      world[x+4][y+4] = true; 
      world[x+4][y+5] = true; 
      world[x+6][y+1] = true; 
      world[x+6][y+3] = true; 
      world[x+6][y+4] = true; 
      world[x+6][y+5] = true; 
      world[x+7][y+1] = true; 
      world[x+7][y+6] = true; 
      world[x+8][y+5] = true; 
      world[x+8][y+6] = true; 
      world[x+9][y+5] = true; 
}


void pattern_O7(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+6] = true; 
  world[x+1][y+7] = true; 
  
  world[x+2][y+5] = true; 
  world[x+2][y+8] = true; 
  
  world[x+3][y+5] = true; 
  world[x+3][y+6] = true; 
  world[x+3][y+7] = true; 
  
  world[x+4][y+4] = true;
  world[x+4][y+8] = true; 
  
  world[x+5][y+4] = true; 
  world[x+5][y+5] = true; 
  world[x+5][y+6] = true; 
  world[x+5][y+7] = true; 
  world[x+5][y+9] = true; 
  
  world[x+6][y+4] = true; 
  world[x+6][y+5] = true; 
  world[x+6][y+7] = true; 
  world[x+6][y+9] = true; 
  
  world[x+7][y+2] = true; 
  world[x+7][y+4] = true; 
  world[x+7][y+6] = true; 
  world[x+7][y+8] = true; 
  
  world[x+8][y+1] = true; 
  world[x+8][y+3] = true; 
  world[x+8][y+5] = true; 
  world[x+8][y+6] = true; 
  
  world[x+9][y+1] = true; 
  world[x+9][y+6] = true; 
  world[x+9][y+3] = true; 
  world[x+9][y+4] = true; 
  world[x+9][y+5] = true; 
  
  world[x+10][y+2] = true; 
  world[x+10][y+6] = true; 
  
  world[x+11][y+3] = true; 
  world[x+11][y+4] = true; 
  world[x+11][y+5] = true; 
  world[x+12][y+2] = true; 
  world[x+12][y+5] = true; 
  world[x+13][y+3] = true; 
  world[x+13][y+4] = true; 
  
}


void pattern_O8(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
      world[x+1][y+1] = true; 
      world[x+1][y+2] = true; 
      world[x+1][y+3] = true; 
      world[x+2][y+1] = true; 
      world[x+2][y+2] = true; 
      world[x+2][y+3] = true; 
      world[x+3][y+1] = true; 
      world[x+3][y+2] = true; 
      world[x+3][y+3] = true; 
      world[x+4][y+4] = true; 
      world[x+4][y+5] = true; 
      world[x+4][y+6] = true; 
      world[x+5][y+4] = true; 
      world[x+5][y+5] = true; 
      world[x+5][y+6] = true; 
      world[x+6][y+4] = true; 
      world[x+6][y+5] = true; 
      world[x+6][y+6] = true; 
  
}


void pattern_O9(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+4] = true; 
  world[x+1][y+5] = true; 
  world[x+1][y+6] = true; 
  world[x+2][y+3] = true; 
  world[x+2][y+7] = true; 
  world[x+3][y+2] = true; 
  world[x+3][y+8] = true; 
  world[x+5][y+1] = true; 
  world[x+5][y+9] = true; 
  world[x+6][y+1] = true; 
  world[x+6][y+9] = true; 
  world[x+8][y+2] = true; 
  world[x+8][y+8] = true; 
  world[x+9][y+3] = true; 
  world[x+9][y+7] = true;  
  world[x+10][y+4] = true; 
  world[x+10][y+5] = true; 
  world[x+10][y+6] = true; 
  
}



void pattern_O10(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+4] = true; 
  world[x+1][y+5] = true; 
  world[x+2][y+4] = true; 
  world[x+2][y+5] = true; 
  world[x+7][y+4] = true; 
  world[x+8][y+4] = true; 
  world[x+9][y+3] = true; 
  world[x+9][y+5] = true; 
  world[x+10][y+2] = true; 
  world[x+10][y+3] = true; 
  world[x+10][y+5] = true; 
  world[x+10][y+6] = true; 
  world[x+11][y+1] = true; 
  world[x+11][y+7] = true; 
  world[x+12][y+4] = true; 
  world[x+13][y+1] = true; 
  world[x+13][y+2] = true; 
  world[x+13][y+6] = true; 
  world[x+13][y+7] = true; 
  world[x+16][y+5] = true; 
  world[x+17][y+5] = true; 
  world[x+18][y+6] = true; 
  world[x+21][y+3] = true; 
  world[x+21][y+4] = true; 
  world[x+22][y+3] = true; 
  world[x+22][y+4] = true; 
  
  
}








void pattern_S1(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+1] = true; 
  world[x+1][y+2] = true; 
  world[x+2][y+1] = true; 
  world[x+2][y+2] = true; 
  
}


void pattern_S2(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+2] = true; 
  world[x+2][y+1] = true; 
  world[x+2][y+3] = true; 
  world[x+3][y+2] = true; 
  
}



void pattern_S3(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+2] = true; 
  world[x+1][y+3] = true; 
  world[x+2][y+1] = true; 
  world[x+2][y+3] = true; 
  world[x+3][y+2] = true; 
  
}


void pattern_S4(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+2] = true; 
  world[x+2][y+1] = true; 
  world[x+2][y+3] = true; 
  world[x+3][y+1] = true; 
  world[x+3][y+3] = true; 
  world[x+4][y+2] = true; 
  
}


void pattern_S5(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+2] = true; 
  world[x+2][y+1] = true; 
  world[x+2][y+3] = true; 
  world[x+3][y+1] = true; 
  world[x+3][y+4] = true; 
  world[x+4][y+2] = true; 
  world[x+4][y+3] = true; 
  
}



void pattern_S6(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+5] = true; 
  world[x+1][y+6] = true; 
  world[x+2][y+4] = true; 
  world[x+2][y+6] = true; 
  world[x+3][y+4] = true; 
  world[x+4][y+2] = true; 
  world[x+4][y+3] = true; 
  world[x+4][y+4] = true; 
  world[x+5][y+1] = true; 
  world[x+6][y+1] = true; 
  world[x+6][y+2] = true; 
  
}


void pattern_S7(){ 
  int x = int(random(5,65)); 
  int y = int(random(5,35)); 
  
  world[x+1][y+4] = true; 
  world[x+1][y+5] = true; 
  world[x+2][y+5] = true; 
  world[x+3][y+4] = true; 
  world[x+4][y+1] = true; 
  world[x+4][y+3] = true; 
  world[x+5][y+1] = true; 
  world[x+5][y+2] = true; 

}



void pattern_M1(){
  int x = int(random(5,145)); 
  int y = int(random(90,100)); 
  
  world[x+1][y+7] = true; 
  world[x+1][y+9] = true; 
  world[x+2][y+4] = true; 
  world[x+2][y+9] = true; 
  world[x+3][y+3] = true; 
  world[x+3][y+4] = true; 
  world[x+3][y+5] = true; 
  world[x+3][y+10] = true; 
  world[x+4][y+2] = true; 
  world[x+4][y+4] = true; 
  world[x+5][y+1] = true; 
  world[x+5][y+2] = true; 
  world[x+5][y+5] = true; 
  world[x+5][y+6] = true; 
  world[x+5][y+11] = true; 
  world[x+6][y+2] = true; 
  world[x+6][y+3] = true; 
  world[x+6][y+6] = true; 
  world[x+6][y+7] = true; 
  world[x+6][y+8] = true; 
  world[x+6][y+9] = true; 
  world[x+6][y+10] = true; 
  
  world[x+10][y+2] = true; 
  world[x+10][y+3] = true; 
  world[x+10][y+6] = true; 
  world[x+10][y+7] = true; 
  world[x+10][y+8] = true; 
  world[x+10][y+9] = true; 
  world[x+10][y+10] = true; 
  world[x+11][y+1] = true; 
  world[x+11][y+2] = true; 
  world[x+11][y+5] = true; 
  world[x+11][y+6] = true; 
  world[x+11][y+11] = true; 
  world[x+12][y+2] = true; 
  world[x+12][y+4] = true; 
  world[x+13][y+3] = true; 
  world[x+13][y+4] = true; 
  world[x+13][y+5] = true; 
  world[x+13][y+10] = true; 
  world[x+14][y+4] = true; 
  world[x+14][y+9] = true; 
  world[x+15][y+7] = true; 
  world[x+15][y+9] = true;
}


void pattern_M2(){
  int x = int(random(50,100)); 
  int y = int(random(50,60)); 
  
  world[x+1][y+1] = true; 
  world[x+1][y+2] = true; 
  world[x+1][y+5] = true; 
  world[x+1][y+6] = true; 
  world[x+2][y+1] = true; 
  world[x+2][y+2] = true; 
  world[x+2][y+4] = true; 
  world[x+2][y+5] = true; 
  world[x+3][y+6] = true; 
  
}


void pattern_M3(){
  int x = int(random(50,100)); 
  int y = int(random(10,30)); 
  
  world[x+1][y+4] = true; 
  world[x+1][y+5] = true; 
  world[x+2][y+4] = true; 
  world[x+2][y+5] = true; 
  world[x+4][y+4] = true; 
  world[x+5][y+3] = true; 
  world[x+5][y+5] = true; 
  world[x+6][y+3] = true; 
  world[x+6][y+5] = true; 
  world[x+7][y+4] = true; 
  world[x+10][y+1] = true; 
  world[x+10][y+2] = true; 
  world[x+10][y+4] = true; 
  world[x+10][y+6] = true; 
  world[x+10][y+7] = true; 
  world[x+11][y+1] = true; 
  world[x+11][y+7] = true; 
  world[x+12][y+2] = true; 
  world[x+12][y+6] = true; 
  world[x+13][y+3] = true; 
  world[x+13][y+4] = true; 
  world[x+13][y+5] = true; 
  
  world[x+20][y+6] = true; 
  world[x+21][y+7] = true; 
  world[x+22][y+5] = true; 
  world[x+22][y+6] = true; 
  world[x+22][y+7] = true; 
  
  world[x+27][y] = true; 
  world[x+27][y+1] = true; 
  world[x+27][y+2] = true; 
  world[x+27][y+3] = true; 
  world[x+27][y+4] = true; 
  world[x+28][y-1] = true; 
  world[x+28][y+1] = true; 
  world[x+28][y+2] = true; 
  world[x+28][y+3] = true; 
  world[x+28][y+5] = true; 
  world[x+29][y] = true; 
  world[x+29][y+4] = true; 
  world[x+30][y+1] = true; 
  world[x+30][y+2] = true; 
  world[x+30][y+3] = true; 
  world[x+31][y+2] = true; 
  
  world[x+35][y+2] = true; 
  world[x+35][y+3] = true; 
  world[x+36][y+2] = true; 
  world[x+36][y+3] = true; 

}


void pattern_M4(){
  int x = int(random(5,135)); 
  int y = int(random(10,100)); 
  
  world[x+1][y+5] = true; 
  world[x+1][y+11] = true; 
  world[x+2][y+5] = true; 
  world[x+2][y+11] = true; 
  world[x+3][y+5] = true; 
  world[x+3][y+6] = true; 
  world[x+3][y+10] = true; 
  world[x+3][y+11] = true; 
  world[x+5][y+1] = true; 
  world[x+5][y+2] = true; 
  world[x+5][y+3] = true; 
  world[x+5][y+6] = true; 
  world[x+5][y+7] = true; 
  world[x+5][y+9] = true; 
  world[x+5][y+10] = true; 
  world[x+5][y+13] = true; 
  world[x+5][y+14] = true; 
  world[x+5][y+15] = true; 
  world[x+6][y+3] = true; 
  world[x+6][y+5] = true; 
  world[x+6][y+7] = true; 
  world[x+6][y+9] = true; 
  world[x+6][y+11] = true; 
  world[x+6][y+13] = true; 
  world[x+7][y+5] = true; 
  world[x+7][y+6] = true; 
  world[x+7][y+10] = true; 
  world[x+7][y+11] = true; 
  
  world[x+9][y+11] = true; 
  world[x+9][y+10] = true; 
  world[x+9][y+6] = true; 
  world[x+9][y+5] = true; 
  world[x+10][y+3] = true; 
  world[x+10][y+5] = true; 
  world[x+10][y+7] = true; 
  world[x+10][y+9] = true; 
  world[x+10][y+11] = true; 
  world[x+10][y+13] = true; 
  world[x+11][y+1] = true; 
  world[x+11][y+2] = true; 
  world[x+11][y+3] = true; 
  world[x+11][y+6] = true; 
  world[x+11][y+7] = true; 
  world[x+11][y+9] = true; 
  world[x+11][y+10] = true; 
  world[x+11][y+13] = true; 
  world[x+11][y+14] = true; 
  world[x+11][y+15] = true; 
  world[x+13][y+5] = true; 
  world[x+13][y+6] = true; 
  world[x+13][y+10] = true; 
  world[x+13][y+11] = true; 
  world[x+14][y+5] = true; 
  world[x+14][y+11] = true; 
  world[x+15][y+5] = true; 
  world[x+15][y+11] = true; 

}


void pattern_M5(){
  int x = int(random(10,130)); 
  int y = int(random(10,90));
  
  world[x+1][y+9] = true; 
  world[x+2][y+10] = true; 
  world[x+2][y+11] = true; 
  world[x+4][y+12] = true; 
  world[x+5][y+7] = true; 
  world[x+5][y+11] = true; 
  world[x+6][y+7] = true; 
  world[x+6][y+9] = true; 
  world[x+6][y+10] = true; 
  world[x+7][y+8] = true; 
  world[x+7][y+17-1] = true; 
  world[x+7][y+18-1] = true; 
  world[x+8][y+16-1] = true; 
  world[x+9][y+17-1] = true; 
  world[x+9][y+22-1] = true; 
  world[x+10][y+4] = true; 
  world[x+10][y+17-1] = true; 
  world[x+10][y+21-1] = true; 
  world[x+11][y+2] = true; 
  world[x+11][y+5] = true; 
  world[x+11][y+18-1] = true; 
  world[x+11][y+21-1] = true; 
  world[x+12][y+2] = true; 
  world[x+12][y+6] = true; 
  world[x+12][y+19-1] = true; 
  world[x+13][y+1] = true; 
  world[x+13][y+6] = true; 
  world[x+14][y+7] = true; 
  world[x+15][y+5] = true; 
  world[x+15][y+6] = true; 
  world[x+15][y+14] = true; 
  world[x+16][y+12] = true; 
  world[x+16][y+13] = true; 
  world[x+16][y+15] = true; 
  world[x+17][y+11] = true; 
  world[x+17][y+15] = true; 
  world[x+18][y+10] = true; 
  world[x+20][y+11] = true; 
  world[x+20][y+12] = true; 
  world[x+21][y+13] = true; 

}


void pattern_M6(){
  int x = int(random(5,135)); 
  int y = int(random(90,95)); 
  
  world[x+1][y+1] = true; 
  world[x+1][y+2] = true; 
  world[x+1][y+3] = true; 
  world[x+1][y+4] = true; 
  world[x+1][y+5] = true; 
  world[x+1][y+6] = true; 
  
  world[x+2][y+1] = true; 
  world[x+2][y+7] = true; 
  
  world[x+3][y+1] = true; 
  world[x+4][y+2] = true; 
  
  world[x+4][y+7] = true; 
  world[x+5][y+4] = true; 
  world[x+5][y+5] = true; 

}

void pattern_M7(){
  int x = int(random(5,130)); 
  int y = int(random(80,85)); 
      world[x+1][y+4] = true; 
  world[x+1][y+5] = true; 
  world[x+2][y+4] = true; 
  world[x+2][y+5] = true; 
  world[x+7][y+4] = true; 
  world[x+8][y+4] = true; 
  world[x+9][y+3] = true; 
  world[x+9][y+5] = true; 
  world[x+10][y+2] = true; 
  world[x+10][y+3] = true; 
  world[x+10][y+5] = true; 
  world[x+10][y+6] = true; 
  world[x+11][y+1] = true; 
  world[x+11][y+7] = true; 
  world[x+12][y+4] = true; 
  world[x+13][y+1] = true; 
  world[x+13][y+2] = true; 
  world[x+13][y+6] = true; 
  world[x+13][y+7] = true; 
  world[x+16][y+5] = true; 
  world[x+17][y+5] = true; 
  world[x+18][y+6] = true; 
  world[x+21][y+3] = true; 
  world[x+21][y+4] = true; 
  world[x+22][y+3] = true; 
  world[x+22][y+4] = true; 
}






void pattern_SS1() {
  int x = int(random(5,15)); 
  int y = int(random(5,15)); 
  
  world[x+1][y+1] = true; 
  world[x+2][y+2] = true; 
  world[x+2][y+3] = true; 
  world[x+3][y+1] = true; 
  world[x+3][y+2] = true; 

}

void pattern_SS2() {
  int x = int(random(60,65)); 
  int y = int(random(5,55)); 
  
  world[x+1][y+1] = true; 
  world[x+1][y+2] = true; 
  world[x+1][y+3] = true; 
  world[x+2][y+1] = true; 
  world[x+2][y+4] = true; 
  world[x+3][y+1] = true; 
  world[x+4][y+1] = true; 
  world[x+5][y+2] = true; 
  world[x+5][y+4] = true; 

}

void pattern_SS3() {
  int x = int(random(5,10)); 
  int y = int(random(5,55)); 


  world[x+1][y+2] = true; 
  world[x+1][y+3] = true; 
  world[x+1][y+4] = true; 
  world[x+2][y+2] = true; 
  world[x+2][y+3] = true; 
  world[x+2][y+4] = true; 
  world[x+3][y+2] = true; 
  world[x+4][y+2] = true; 
  world[x+4][y+3] = true; 
  world[x+5][y+1] = true; 
  world[x+5][y+4] = true; 
  world[x+6][y+1] = true; 
  world[x+6][y+7] = true; 
  world[x+6][y+8] = true; 
  world[x+7][y+1] = true; 
  world[x+7][y+5] = true; 
  world[x+7][y+6] = true;
  world[x+7][y+7] = true; 
  world[x+7][y+8] = true; 
  world[x+8][y+1] = true; 
  world[x+8][y+6] = true; 
  world[x+8][y+7] = true; 
  world[x+8][y+9] = true; 
  world[x+9][y+1] = true; 
  world[x+9][y+4] = true; 
  world[x+9][y+7] = true; 
  world[x+9][y+8] = true; 
  world[x+9][y+9] = true; 
  world[x+10][y+1] = true; 
  world[x+10][y+2] = true; 
  world[x+10][y+3] = true; 
  world[x+10][y+8] = true; 

}

void pattern_SS4() {
  int x = int(random(5,65)); 
  int y = int(random(50,55)); 


  world[x+1][y+2] = true; 
  world[x+1][y+5] = true; 
  world[x+2][y+1] = true; 
  world[x+3][y+1] = true; 
  world[x+3][y+5] = true; 
  world[x+4][y+1] = true; 
  world[x+4][y+2] = true; 
  world[x+4][y+3] = true; 
  world[x+4][y+4] = true; 
  
  world[x+8][y+5] = true; 
  world[x+8][y+6] = true; 
  world[x+9][y+3] = true; 
  world[x+9][y+4] = true; 
  world[x+9][y+6] = true; 
  world[x+9][y+7] = true; 
  world[x+9][y+11] = true; 
  world[x+10][y+3] = true;
  world[x+10][y+6] = true; 
  world[x+10][y+11] = true; 
  world[x+10][y+13] = true; 
  world[x+11][y+3] = true; 
  world[x+11][y+6] = true; 
  world[x+11][y+11] = true; 
  world[x+11][y+12] = true; 
  world[x+12][y+4] = true; 
  world[x+12][y+5] = true; 
  
  world[x+15][y+2] = true; 
  world[x+15][y+5] = true; 
  world[x+16][y+1] = true; 
  world[x+17][y+1] = true; 
  world[x+17][y+5] = true; 
  world[x+18][y+1] = true; 
  world[x+18][y+2] = true; 
  world[x+18][y+3] = true; 
  world[x+18][y+4] = true; 

}


void pattern_SS5() {
  int x = int(random(5,65)); 
  int y = int(random(50,55)); 


  world[x+1][y+5] = true; 
  world[x+1][y+6] = true; 
  world[x+2][y+4] = true; 
  world[x+2][y+7] = true; 
  world[x+3][y+3] = true; 
  world[x+3][y+4] = true; 
  world[x+3][y+6] = true; 
  world[x+4][y+4] = true; 
  world[x+4][y+5] = true; 
  world[x+4][y+6] = true; 
  world[x+4][y+7] = true; 
  world[x+5][y+5] = true; 
  
  
  world[x+6][y+7] = true; 
  world[x+6][y+8] = true; 
  world[x+6][y+9] = true; 
  world[x+7][y+3] = true; 
  world[x+7][y+4] = true;
  world[x+7][y+5] = true; 
  world[x+7][y+6] = true; 
  world[x+7][y+7] = true; 
  world[x+7][y+8] = true; 
  world[x+7][y+9] = true; 
  world[x+8][y+2] = true; 
  world[x+8][y+3] = true; 
  world[x+8][y+4] = true; 
  world[x+8][y+5] = true; 
  world[x+8][y+6] = true; 
  world[x+8][y+9] = true; 
  world[x+9][y+1] = true; 
  world[x+9][y+2] = true; 
  world[x+9][y+4] = true; 
  world[x+9][y+5] = true; 
  world[x+10][y+2] = true; 
  world[x+10][y+3] = true; 
  world[x+10][y+6] = true; 
  world[x+10][y+7] = true;
  
  world[x+13][y+4] = true; 
  world[x+13][y+5] = true;
  world[x+13][y+6] = true; 
  world[x+13][y+7] = true;
  world[x+14][y+3] = true; 
  world[x+14][y+4] = true;
  world[x+14][y+5] = true; 
  world[x+14][y+6] = true;
  world[x+14][y+7] = true; 
  world[x+14][y+8] = true;
  world[x+15][y+2] = true; 
  world[x+15][y+3] = true;
  
  world[x+15][y+5] = true; 
  world[x+15][y+6] = true;
  world[x+15][y+7] = true; 
  world[x+15][y+8] = true;
  world[x+16][y+3] = true; 
  world[x+16][y+4] = true;

}


void pattern_SS6() {
  int x = int(random(5,65)); 
  int y = int(random(50,55)); 


  world[x+5][y+1] = true; 
  world[x+6][y+1] = true; 
  world[x+4][y+2] = true; 
  world[x+5][y+2] = true; 
  world[x+6][y+2] = true; 
  world[x+7][y+2] = true; 
  
  world[x+3][y+4] = true; 
  world[x+4][y+4] = true; 
  world[x+5][y+4] = true; 
  world[x+6][y+4] = true; 
  world[x+7][y+4] = true; 
  world[x+8][y+4] = true; 
  
  world[x+4][y+5] = true; 
  world[x+5][y+5] = true; 
  world[x+6][y+5] = true; 
  world[x+7][y+5] = true; 
  
  world[x+3][y+7] = true;
  world[x+4][y+7] = true; 
  world[x+7][y+7] = true; 
  world[x+8][y+7] = true; 
  world[x+1][y+8] = true; 
  world[x+2][y+8] = true; 
  world[x+4][y+8] = true; 
  world[x+7][y+8] = true; 
  world[x+9][y+8] = true; 
  world[x+10][y+8] = true; 
  world[x+4][y+9] = true; 
  world[x+7][y+9] = true; 
  
  world[x+5][y+12] = true; 
  world[x+6][y+12] = true; 
  world[x+5][y+13] = true; 
  world[x+6][y+13] = true; 

}



void pattern_SS7() {
  int x = int(random(5,65)); 
  int y = int(random(50,55)); 


  world[x+2][y+1] = true; 
  world[x+1][y+2] = true; 
  world[x+3][y+2] = true;  
  
  world[x+1][y+3] = true; 
  world[x+4][y+3] = true; 
  world[x+2][y+4] = true; 
  world[x+3][y+4] = true; 


  
  world[x+1][y+6] = true;
  world[x+7][y+6] = true; 
  world[x+2][y+7] = true; 
  world[x+6][y+7] = true; 
  world[x+8][y+7] = true; 
  world[x+1][y+8] = true; 
  world[x+2][y+8] = true; 
  world[x+6][y+8] = true; 
  world[x+9][y+8] = true; 

  world[x+1][y+9] = true; 
  world[x+5][y+9] = true; 
  world[x+6][y+9] = true; 
  world[x+9][y+9] = true; 


}
