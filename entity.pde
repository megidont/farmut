class entity{
  
  int id;                                           //unique integer id, maybe from entity count?
  PImage sprite = spriteSheet[6][5];                //set sprite = spriteSheet[x][y] for one file tileset
  boolean delete = false;                           //flagging for deletion
  boolean passable = true;                         //can entities pass?
  int x;
  int y;
  int layer;
  int frame;
  String type = "entity";
  PImage[] frames = new PImage[]{
    spriteSheet[14][1]                            //grass
  };
  int frametime = 1;
  int curframe = 0;
  
  entity(int startx, int starty, int startlayer){
    x = startx;
    y = starty;
    layer = startlayer;
    id = entcount++;
    frame = 0;
    sprite = frames[0];
  }
  void interact(entity e){};
  void interactPlayer(playerClass e){};
  void destroy(){
    this.delete = true;
  };
  String toString(){
    return id + ": [0][0]";
  }
  void update(){
    frameAdvance();
  };
  void frameAdvance(){
    if(frame > frametime){
      if(++curframe > frames.length - 1){
        curframe = 0;
      }
      frame = 0;
    }
    sprite = frames[curframe];
    frame++;
  }
  void select(){};
  void deselect(){};
  void interact(int eraction){};
  
}
