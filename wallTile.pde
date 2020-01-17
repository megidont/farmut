class wallTile extends entity{
  
  wallTile(int startx, int starty, int startlayer){
    super(startx, starty, startlayer);
    sprite = spriteSheet[11][4];
    frames = new PImage[]{
      spriteSheet[11][4]
    };
    passable = false;
    int j = int(random(0,4));
    frametime = 60;
    type = "wall";
  }
  
}
