class crop extends entity{
  
  int state;
  
  crop(int startx, int starty){
    super(startx, starty, 2);
    frames = new PImage[]{
      spriteSheet[9][9],             //cs1
      spriteSheet[10][9],            //cs2
      spriteSheet[5][3]              //crop
    };
    passable = true;
    int j = int(random(0,4));
    frametime = 1;
    type = "crop";
    state = 0;
    sprite = frames[state];
  }
  
  void interactPlayer(playerClass e){
    if(state == 2){
      e.cropCount++;
      clearText();
      pick.play();
    }
    this.destroy();
  };
  void update(){
    if(int(random(0,600)) == 0 && state + 1 < 3 && gameState == GAMEPLAY){
      state++;
    }
    sprite = frames[state];
  }
  
}
