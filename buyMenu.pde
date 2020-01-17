
//////////////////
///THE BUY MENU///
//////////////////

//1. Sell Crop
//2. Buy Seed
//3. Fix Hoe
//4. Buy Gear

int menuloc;

void drawMenu(boolean redraw){
  clearText();
  if(!redraw){
    menuloc = 0;
  }
  entities[14][10][7] = new hudSprite(14,10,3);
  entities[14][11][7] = new hudSprite(14,11,1);
  entities[14][12][7] = new hudSprite(14,12,0);
  entities[14][13][7] = new hudSprite(14,13,2);
  entities[14][14][7] = new hudSprite(14,14,4);
  writeText(Integer.toString(player.money),11,10);
  writeText(Integer.toString(player.cropCount),11,11);
  writeText(Integer.toString(player.seedCount),11,12);
  writeText(Integer.toString(player.hoeDurability),11,13);
  writeText(Integer.toString(player.tummy),11,14);
  writeText("Buy Menu",4,2);
  entities[0][4][7] = new hudBox(2,2);
  entities[15][4][7] = new hudSprite(15,4,1);
  writeText("Sell Crop 1 ", 2, 4);
  entities[0][5][7] = new hudBox(2,3);
  entities[15][5][7] = new hudSprite(15,5,3);
  writeText("Buy Seed  5", 2, 5);
  entities[0][6][7] = new hudBox(2,4);
  entities[15][6][7] = new hudSprite(15,6,3);
  int hoecost = 100 - player.hoeDurability;
  if(hoecost > player.money){
    hoecost = player.money;
  }
  if(player.hoeDurability > 0){
    writeText("Fix Hoe   " + hoecost, 2, 6);
  }else{
    writeText("Buy Hoe   " + hoecost, 2, 6);
  }
  entities[0][7][7] = new hudBox(2,3);
  entities[15][7][7] = new hudSprite(15,7,1);
  writeText("Eat Crop  1 ", 2, 7);
  entities[0][8][7] = new hudBox(2,5);
  entities[15][8][7] = new hudSprite(15,8,3);
  writeText("Buy Gear  999", 2, 8);
  entities[0][4+menuloc][7].select();
  if(bgm.isPlaying()){
    bgm.stop();
  }
}

void clearMenu(){
  clearText();
}

void menuMoveUp(){
  entities[0][4+menuloc][7].deselect();
  if(menuloc == 0){
    menuloc = 4;
  }else{
    menuloc--;
  }
  entities[0][4+menuloc][7].select();
  if(bgm.isPlaying()){
    bgm.stop();
  }
}
void menuMoveDown(){
  entities[0][4+menuloc][7].deselect();
  if(menuloc == 4){
    menuloc = 0;
  }else{
    menuloc++;
  }
  entities[0][4+menuloc][7].select();
  if(bgm.isPlaying()){
    bgm.stop();
  }
}

void menuInteract(){
  entities[0][4+menuloc][7].interact(menuloc);
}
