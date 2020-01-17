class overlay extends entity{
  
  overlay(int startx, int starty, color c){
    super(startx, starty, 5);
    PImage colorSquare = new PImage(16,16,RGB);
    for(int i = 0; i < colorSquare.width;i++){
      for(int j = 0; j < colorSquare.height;j++){
        colorSquare.set(i,j,c);
      }
    }
    sprite = colorSquare;
    frames = new PImage[]{
      colorSquare
    };
    passable = true;
    int j = int(random(0,4));
    frametime = 60;
    type = "wall";
  }
  
  void update(){};
  
}

void menuOverlay(){

/*for(int i = 0;i < entities.length;i++){
    for(int j = 0;j < entities[i].length;j++){
      entities[i][j][5] = new overlay(i,j,color(255,255,255));
    }
  }*/
  entities[1][1][5] = new overlay(1,1,color(255,255,255));
  if(bgm.isPlaying()){
    bgm.stop();
  }

}

void clearOverlay(){
 
/*for(int i = 0;i < entities.length;i++){
    for(int j = 0;j < entities[i].length;j++){
      entities[i][j][5] = null;
    }
  }*/
  entities[1][1][5] = null;
  
}
