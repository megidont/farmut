////////////////////////////////////////////////
//FARMUT: A game* by Bailey, Evan, and Rasheed//
////////////////////////////////////////////////

import processing.sound.*;

int tileSizeX = 64;                                             //width of tile in pixels
int tileSizeY = 64;                                             //height of tile in pixels
int tileWidth = 16;                                            //width of game in tiles
int tileHeight = 16;                                           //height of game in tiles
PImage tileset;                                                //full tileset image
PImage[][] spriteSheet;                                        //spritesheet to pull from
entity[][][] entities;                                         //stores all the entities
int entcount = 0;                                              //deprecated entity counter
int NORTH = 0;                                                 //Directions for neighbor
int EAST = 1;                                                  //Directions for neighbor
int SOUTH = 2;                                                 //Directions for neighbor
int WEST = 3;                                                  //Directions for neighbor
int GAMEPLAY = 0;
int MENU = 1;
int TITLESCREEN = 2;
int TITLECARD1 = 3;
int TITLECARD2 = 4;
int TITLECARD3 = 5;
int GAMEOVER = 6;
int VICTORY = 7;
int cheat = 0;
int gameState;
PImage titleScreen;
PImage titleCard1;
PImage titleCard2;
PImage titleCard3;
PImage gameover;
PImage victory;
boolean cheating = false;
entity out;
playerClass player;

entity getSpace(int x, int y, int layer, int dir){
  
    if(dir == NORTH){
      if(y == 0){
        return out;
      }else{
        if(notNull(entities[x][y - 1][layer])){
          return entities[x][y - 1][layer];
        }else{
          return new entity(x, y - 1, layer);
        }
      }
    }else if(dir == EAST){
      if(x == entities.length - 1){
        return out;
      }else{
        if(notNull(entities[x + 1][y][layer])){
          return entities[x + 1][y][layer];
        }else{
          return new entity(x + 1, y, layer);
        }
      }
    }else if(dir == SOUTH){
      if(y == entities[x].length - 1){
        return out;
      }else{
        if(notNull(entities[x][y + 1][layer])){
          return entities[x][y + 1][layer];
        }else{
          return new entity(x, y + 1, layer);
        }
      }
    }else if(dir == WEST){
      if(x == 0){
        return out;
      }else{
        if(notNull(entities[x - 1][y][layer])){
          return entities[x - 1][y][layer];
        }else{
          return new entity(x - 1, y, layer);
        }
      }
    }else{
      return out;
    }
    
}

entity neighbor(int x, int y, int layer, int dir){
  
    if(dir == NORTH){
      if(y == 0){
        return out;
      }else{
        return entities[x][y - 1][layer];
      }
    }else if(dir == EAST){
      if(x == entities.length - 1){
        return out;
      }else{
        return entities[x + 1][y][layer];
      }
    }else if(dir == SOUTH){
      if(y == entities[x].length - 1){
        return out;
      }else{
        return entities[x][y + 1][layer];
      }
    }else if(dir == WEST){
      if(x == 0){
        return out;
      }else{
        return entities[x - 1][y][layer];
      }
    }else{
      return out;
    }
    
}

/*

Lets talk layers.
Layer 0: World entities. Ground, water, etc.
Layer 1: World object entities. Fences, invisible walls, etc.
Layer 2: Temporary object entities. Plants, tilled soil, etc.
Layer 3: Players.
Layer 4: Weather (UNIMPLEMENTED)
Layer 5: Overlays
Layer 6: Menu entities
Layer 7: Text

*/

boolean notNull(entity e){
  if( e != null ){
    return true;
  }else{
    return false;
  }
}

void loadmap(entity[][][] entities, String[] map, int layer){

  for(int i = 0; i < map.length; i++){
    for(int j = 0; j < map[i].length(); j++){
      int c = Character.getNumericValue(map[j].charAt(i));
      if(c > 0 && c < 9){
        entities[i][j][layer] = new fenceTile(i,j,layer,c - 1);
      }else if(layer == 0){
        entities[i][j][layer] = new entity(i,j,layer);
      }
    }
  }
  
}

void writeText(String s, int x, int y){

  s = s.toLowerCase();
  char[] chars = s.toCharArray();
  int lineLength = tileWidth - y;
  int lineHeight = tileHeight - x;
  int k = 0;
  for(int i = 0;i < lineLength;i++){
    for(int j = 0; j < lineHeight; j++){
      if(k < chars.length && x + j < 16 && y + 1 < 16){
        entities[x + j][y + i][7] = new letter(x + j, y + i, chars[k]);
        k++;
      }
    }
  }
  
}

void clearText(){

  for(int i = 0;i < entities.length;i++){
    for(int j = 0;j < entities[i].length;j++){
      entities[i][j][7] = null;
    }
  }

}

public void settings(){
    size(tileWidth*tileSizeX, tileHeight*tileSizeY);
}

public void setup(){
  entities = new entity[tileWidth][tileHeight][8];
  importSounds();
  tileset = loadImage("tileset.png");
  titleScreen = loadImage ("titleScreen.png");
  titleCard1 = loadImage("titleCard1.png");
  titleCard2 = loadImage("titleCard2.png");
  titleCard3 = loadImage("titleCard3.png");
  gameover = loadImage("gameOver.png");
  victory = loadImage("victory.png");
  spriteSheet = new PImage[tileset.width/tileSizeX][tileset.height/tileSizeY];
//println(tileset.width + " " + tileSizeX + " " + tileset.height + " " + tileSizeY);
  for(int i = 0;i < spriteSheet.length;i++){
    for(int j = 0; j < spriteSheet[i].length;j++){
      spriteSheet[i][j] = tileset.get(i*tileSizeX, j*tileSizeY,tileSizeX,tileSizeY);
    }
  }
  out = new entity(-12, -12, -12);
  out.passable = false;
  String[] layer1Map = loadStrings("layer1Map.txt");
  String[] layer0Map = loadStrings("layer0Map.txt");
  loadmap(entities, layer0Map, 0);
  loadmap(entities, layer1Map, 1);
  gameState = TITLESCREEN;
  player = new playerClass(8,8);
  entities[player.x][player.y][player.layer] = player;
  noCursor();
}

public void draw(){
  if(gameState < 2){
    background(0);
    if(bgm.isPlaying() == false && gameState != MENU){
      bgm.play(.667,.5);
    }
    for(int i = 0;i < entities.length;i++){
      for(int j = 0;j < entities[i].length; j++){
        for(int k = 0;k < entities[i][j].length; k++){
          if(notNull(entities[i][j][k]) && entities[i][j][k].delete == false){
            if(k < 4 && k > 1){
              entities[i][j][k].update();      //turns out running 768 empty functions per frame is a drain on resources. Huh!
            }
            if(k == 5){
              tint(231,194,81,128);
            }else{
              tint(255,255,255,255);
            }
            if(gameState != MENU){
                image(entities[i][j][k].sprite, i * tileSizeX, j * tileSizeY, tileSizeX, tileSizeY);
            }else if(k > 5){
              image(entities[i][j][k].sprite, i * tileSizeX, j * tileSizeY, tileSizeX, tileSizeY);
            }
          }else if(notNull(entities[i][j][k]) && entities[i][j][k].delete == true){
            entities[i][j][k] = null;
          }
          if(i == player.x && j == player.y && k == player.layer){
            entities[i][j][k] = player;
          }else if(k == player.layer){
            entities[i][j][k] = null;
          }
        }
      }
    }
  }else if(gameState == TITLESCREEN){
    background(0);
    image(titleScreen,0,0);
  }else if(gameState == TITLECARD1){
    background(0);
    image(titleCard1,0,0);
  }else if(gameState == TITLECARD2){
    background(0);
    image(titleCard2,0,0);
  }else if(gameState == TITLECARD3){
    background(0);
    image(titleCard3,0,0);
  }else if(gameState == GAMEOVER){
    background(0);
    bgm.stop();
    image(gameover,0,0);
  }else if(gameState == VICTORY){
    clearOverlay();
    background(0);
    bgm.stop();
    image(victory,0,0);
  }
    
}
public void mouseClicked(){
  if(mouseButton == RIGHT){
    keyCode = player.menuKey;
    keyPressed();
  }else if(mouseButton == LEFT){
    keyCode = player.hoeKey;
    keyPressed();
  }
}
public void keyPressed(){
  
  if(keyCode == player.seedKey2){
    keyCode = player.seedKey;
  }
  if(keyCode == player.resetKey){
    bgm.stop();
    gameState = TITLESCREEN;
    setup();
    key = 0;
  }  
  if(gameState == GAMEPLAY){
    if(keyCode == player.upKey){
      player.move(NORTH);
    }else if(keyCode == player.downKey){
      player.move(SOUTH);
    }else if(keyCode == player.leftKey){
      player.move(WEST);
    }else if(keyCode == player.rightKey){
      player.move(EAST);
    }else if(keyCode == player.menuKey){
      writeText("Paused",5,7);
      menuOverlay();
      drawMenu(false);
      bgm.pause();
      menuopen.play();
      key = 0;                                          //prevents exit on esc for menu
      gameState = MENU;
    }else if(keyCode == player.hoeKey){
      player.hoe();
    }else if(keyCode == player.seedKey){
      player.sow();
    }
  }else if(gameState == MENU){
    if(keyCode == player.upKey){
      menuMoveUp();
    }else if(keyCode == player.downKey){
      menuMoveDown();
    }else if(keyCode == player.leftKey){
//      player.move(WEST);
    }else if(keyCode == player.rightKey){
//      player.move(EAST);
    }else if(keyCode == player.menuKey){
      clearOverlay();
      clearMenu();
      menuback.play();
      clearText();
      key = 0;        //prevents exit on esc for menu
      gameState = GAMEPLAY;
    }else if(keyCode == player.hoeKey){
      menuInteract();
    }else if(keyCode == player.seedKey){
      menuInteract();
    }
  }else if(gameState == TITLESCREEN){
    if(keyCode == player.upKey){
      if(cheat == 1){
        cheat++;
      }
      else{
        cheat = 1;
      }
    }else if(keyCode == player.downKey){
      if(cheat == 2){
        cheat++;
      }else if(cheat == 3){
        cheat++;
      }else{
        cheat = 0;
      }
    }else if(keyCode == player.leftKey){
      if(cheat == 4){
        cheat++;
      }else if(cheat == 6){
        cheat++;
      }else{
        cheat = 0;
      }
    }else if(keyCode == player.rightKey){
      if(cheat == 5){
        cheat++;
      }else if(cheat == 7){
        cheat++;
      }else{
        cheat = 0;
      }
    }else if(keyCode == player.menuKey){
      gameState = TITLECARD1;
      gamestart.play();
      key = 0;                                          //prevents exit on esc for menu
    }else if(keyCode == player.hoeKey){
      if(cheat == 8){
        cheat++;
      }else{
        cheat = 0;
      }
    }else if(keyCode == player.seedKey){
      if(cheat == 9){
        if(cheating != true){
          cheating = true;
          gamestart.play();
        }
      }else{
        cheat = 0;
      }
    }
  }else if(gameState == TITLECARD1){
    if(keyCode == player.menuKey){
      gameState = TITLECARD2;
      key = 0;                                          //prevents exit on esc for menu
    }
  }else if(gameState == TITLECARD2){
    if(keyCode == player.menuKey){
      gameState = TITLECARD3;
      key = 0;                                          //prevents exit on esc for menu
    }
  }else if(gameState == TITLECARD3){
    if(keyCode == player.menuKey){
      gameState = GAMEPLAY;
      bgm.loop(.667,.5);
      key = 0;                                          //prevents exit on esc for menu
    }
  }else if(gameState == GAMEOVER){
    if(keyCode == player.menuKey){
      setup();
      key = 0;                                          //prevents exit on esc for menu
    }
  }else if(gameState == VICTORY){
    if(keyCode == player.menuKey){
      setup();
      key = 0;                                          //prevents exit on esc for menu
    }
  }
  
}
