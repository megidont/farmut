class hudSprite extends entity{
  
  hudSprite(int startx, int starty,int spriteInd){
    super(startx, starty, 7);
    sprite = spriteSheet[11][18];                  //null - X
    frames = new PImage[]{
      spriteSheet[3][3],                           //seed
      spriteSheet[5][3],                           //fruit
      spriteSheet[4][3],                           //scythe
      spriteSheet[6][3],                           //coin
      spriteSheet[7][3]                            //hunger
    };
    sprite = frames[spriteInd];
    passable = true;
    int j = int(random(0,4));
    frametime = 60;
    type = "hudSprite";
  }
  
  void update(){};
  
}
