class tilledSoil extends entity{
  
  tilledSoil(int startx, int starty){
    super(startx, starty, 1);
    sprite = spriteSheet[11][3];
    frames = new PImage[]{
      spriteSheet[11][3]
    };
    passable = true;
    int j = int(random(0,4));
    frametime = 60;
    type = "tilledSoil";
  }
  
}
