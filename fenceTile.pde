class fenceTile extends entity{
  
  fenceTile(int startx, int starty, int startlayer, int frm){
    super(startx, starty, startlayer);
    sprite = spriteSheet[6][5];                              //null black
    frames = new PImage[]{
      spriteSheet[3][5],                                     //tl
      spriteSheet[4][5],                                     //tm
      spriteSheet[5][5],                                     //tr
      spriteSheet[3][6],                                     //ml
      spriteSheet[5][6],                                     //mr
      spriteSheet[3][7],                                     //bl
      spriteSheet[4][7],                                     //bm
      spriteSheet[5][7],                                     //br
    };
    passable = false;
    int j = int(random(0,4));
    frametime = 1;
    sprite = frames[frm];
    type = "fence";
  }
   
  void update(){}
  
}
