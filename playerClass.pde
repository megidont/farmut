class playerClass extends entity{
  
  int upKey = 38;
  int downKey = 40;
  int leftKey = 37;
  int rightKey = 39;
  int menuKey = 27;
  int hoeKey = 67;
  int seedKey = 88;
  int seedKey2 = 90;
  int resetKey = 89;
  int dir;
  int seedCount;
  int cropCount;
  int money;
  int hoeDurability;
  int tummy;
  int tummycount;
  
  playerClass(int startx, int starty){
    super(startx, starty, 3);
    sprite = spriteSheet[0][8];        //barrel
    frames = new PImage[]{
      spriteSheet[0][11],              //NORTH
      spriteSheet[0][10],              //EAST
      spriteSheet[0][8],               //SOUTH
      spriteSheet[0][9]                //WEST
    };
    passable = false;
    int j = int(random(0,4));
    frametime = 1;
    dir = NORTH;
    cropCount = 0;
    seedCount = 10;
    hoeDurability = 100;
    tummy = 100;
    type = "playerClass";
    tummycount = 0;
    money = 10;
    
  }
  void interact(entity e){
    entity target = neighbor(x,y,2,dir);
    if(notNull(target)){
      target.interact(this);
    }
  };
  
  void sow(){
    
    if(seedCount <= 0){
      return;
    }
    entity targetTile = getSpace(x,y,1,dir);
    entity targetEnt = neighbor(x,y,2,dir);
    if(targetTile.type == "tilledSoil"){
      if(targetEnt == null){
        entities[targetTile.x][targetTile.y][2] = new crop(targetTile.x, targetTile.y);
        seedCount--;
        clearText();
      }
    }

  }
  
  void hoe(){
    if(hoeDurability <= 0){
      return;
    }
    entity targetTile = neighbor(x,y,1,dir);
    entity targetEnt = neighbor(x,y,2,dir);
    if(targetTile == null){
      entity space = getSpace(x,y,1,dir);
      entities[space.x][space.y][1] = new tilledSoil(space.x,space.y);
      hoe.play();
      hoeDurability -= int(random(3,8));
      clearText();
      if(hoeDurability <= 10){
        hoebreaking.play();
      }
      if(hoeDurability <= 0){
          hoeDurability = 0;
          hoebreak.play();
      }
    }else if(targetTile.type == "tilledSoil" && notNull(targetEnt)){
      if(targetEnt.type == "crop"){
        targetEnt.interactPlayer(this);
        hoe.play();
        hoeDurability -= int(random(3,8));
        clearText();
        if(hoeDurability <= 10){
          hoebreaking.play();
        }
        if(hoeDurability <= 0){
          hoeDurability = 0;
          hoebreak.play();
        }
      }
    }
  }
  
  void destroy(){
    this.delete = true;
  };
  
  void update(){
    if(layer != 3){
      this.destroy();
    }
    if(cheating == true){
      money = 500;
      cheating = false;
    }
    if(gameState == GAMEPLAY){
      entities[1][1][7] = new hudSprite(1,1,2);
      entities[1][2][7] = new hudSprite(1,2,0);
      entities[1][3][7] = new hudSprite(1,3,1);
      entities[14][2][7] = new hudSprite(14,2,3);
      entities[14][1][7] = new hudSprite(14,1,4);
      writeText(Integer.toString(hoeDurability),2,1);
      writeText(Integer.toString(seedCount),2,2);
      writeText(Integer.toString(cropCount),2,3);
      writeText(Integer.toString(money),11,2);
      writeText(Integer.toString(tummy),11,1);
      tummycount++;
      if(tummycount > 60){
        tummycount = 0;
        tummy--;
        clearText();
        if(tummy <= 0){
          gameState = GAMEOVER;
        }
      }
    }
  }
  String toString(){
    return id + ": [3][0]";
  }
  
  void move(int direction){
  
    dir = direction;
    sprite = frames[dir];
    entity target = getSpace(x,y,1,direction);
    if(target.passable){
      footstep.play();
      x = target.x;
      y = target.y;
    }else{
      wall.play();
    }
    
  }
  
}
