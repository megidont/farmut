int SELLCROP = 0;
int BUYSEED = 1;
int FIXHOE = 2;
int EATCROP = 3;
int BUYGEAR = 4;

class hudBox extends entity{
  
  hudBox(int startx, int starty){
    super(startx, starty, 7);
    sprite = spriteSheet[13][17];      //box dark
    frames = new PImage[]{
      spriteSheet[13][17],             //box dark
      spriteSheet[12][17]              //box light
    };
    sprite = frames[0];
    passable = true;
    int j = int(random(0,4));
    frametime = 60;
    type = "hudBox";
  }
  
  void select(){
    sprite = frames[1];
  };
  void deselect(){
    sprite = frames[0];
  };
  void interact(int eraction){
    if(eraction == SELLCROP){
      if(player.cropCount >= 1){
        player.cropCount--;
        player.money += 15;
        menuselect.play();
      }else{
        menuback.play();
      }
    }else if(eraction == BUYSEED){
      if(player.money >= 5){
        player.money -= 5;
        player.seedCount += 1;
        menuselect.play();
      }else{
        menuback.play();
      }
    }else if(eraction == FIXHOE){
      if(player.hoeDurability == 100){
        menuback.play();
      }else if(player.money >= (100 - player.hoeDurability)){
        player.money -= (100 - player.hoeDurability);
        player.hoeDurability = 100;
        menuselect.play();
      }else if(player.money > 0){
        player.hoeDurability += player.money;
        player.money = 0;
        menuselect.play();
      }else{
        menuback.play();
      }
    }else if(eraction == EATCROP){
      if(player.cropCount >= 1){
        if(player.tummy != 100){
          player.cropCount--;
        }
        if(player.tummy + 15 > 100){
          player.tummy = 100;
          menuselect.play();
        }else{
          player.tummy += 15;
          menuselect.play();
        }
      }else{
        menuback.play();
      }
    }else if(eraction == BUYGEAR){
      if(player.money > 999){
        player.money -= 999;
        gameState = VICTORY;
      }else{
        menuback.play();
      }
    }
    drawMenu(true);
  };
  void update(){};
  
}
