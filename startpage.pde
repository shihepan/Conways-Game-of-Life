// start video 

void startpage(){
  
  //image(image, 0, 0, width, height);
  
  if(start_movie.available() == true){
    start_movie.read();
    //start_movie.frameRate(60);
    image(start_movie, 0, 0, width, height);
  } 
}
