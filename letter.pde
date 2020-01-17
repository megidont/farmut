class letter extends entity {

  letter(int startx, int starty, char c) {
    super(startx, starty, 7);
    sprite = spriteSheet[3][18];
    frames = new PImage[]{
      spriteSheet[0][16], 
      spriteSheet[1][16], 
      spriteSheet[2][16], 
      spriteSheet[3][16], 
      spriteSheet[4][16], 
      spriteSheet[5][16], 
      spriteSheet[6][16], 
      spriteSheet[7][16], 
      spriteSheet[8][16], 
      spriteSheet[9][16], 
      spriteSheet[10][16], 
      spriteSheet[11][16], 
      spriteSheet[12][16], 
      spriteSheet[13][16], 
      spriteSheet[14][16], 
      spriteSheet[15][16], 
      spriteSheet[0][17], 
      spriteSheet[1][17], 
      spriteSheet[2][17], 
      spriteSheet[3][17], 
      spriteSheet[4][17], 
      spriteSheet[5][17], 
      spriteSheet[6][17], 
      spriteSheet[7][17], 
      spriteSheet[8][17], 
      spriteSheet[9][17], 
      spriteSheet[10][17], 
      spriteSheet[11][17], 
      spriteSheet[0][18], 
      spriteSheet[1][18], 
      spriteSheet[2][18], 
      spriteSheet[3][18], 
      spriteSheet[4][18], 
      spriteSheet[5][18], 
      spriteSheet[6][18], 
      spriteSheet[7][18], 
      spriteSheet[8][18], 
      spriteSheet[9][18], 
      spriteSheet[10][18], 
      spriteSheet[11][18], 
      spriteSheet[12][18], 
      spriteSheet[13][18], 
      spriteSheet[14][18], 
      spriteSheet[15][18]
    };
    passable = true;
    int j = int(random(0, 4));
    frametime = 60;
    type = "letter";
    if (c == '0') {
      sprite = frames[0];
    } else if (c == '1') {
      sprite = frames[1];
    } else if (c == '2') {
      sprite = frames[2];
    } else if (c == '3') {
      sprite = frames[3];
    } else if (c == '4') {
      sprite = frames[4];
    } else if (c == '5') {
      sprite = frames[5];
    } else if (c == '6') {
      sprite = frames[6];
    } else if (c == '7') {
      sprite = frames[7];
    } else if (c == '8') {
      sprite = frames[8];
    } else if (c == '9') {
      sprite = frames[9];
    } else if (c == 'a') {
      sprite = frames[10];
    } else if (c == 'b') {
      sprite = frames[11];
    } else if (c == 'c') {
      sprite = frames[12];
    } else if (c == 'd') {
      sprite = frames[13];
    } else if (c == 'e') {
      sprite = frames[14];
    } else if (c == 'f') {
      sprite = frames[15];
    } else if (c == 'g') {
      sprite = frames[16];
    } else if (c == 'h') {
      sprite = frames[17];
    } else if (c == 'i') {
      sprite = frames[18];
    } else if (c == 'j') {
      sprite = frames[19];
    } else if (c == 'k') {
      sprite = frames[20];
    } else if (c == 'l') {
      sprite = frames[21];
    } else if (c == 'm') {
      sprite = frames[22];
    } else if (c == 'n') {
      sprite = frames[23];
    } else if (c == 'o') {
      sprite = frames[24];
    } else if (c == 'p') {
      sprite = frames[25];
    } else if (c == 'q') {
      sprite = frames[26];
    } else if (c == 'r') {
      sprite = frames[27];
    } else if (c == 's') {
      sprite = frames[28];
    } else if (c == 't') {
      sprite = frames[29];
    } else if (c == 'u') {
      sprite = frames[30];
    } else if (c == 'v') {
      sprite = frames[31];
    } else if (c == 'w') {
      sprite = frames[32];
    } else if (c == 'x') {
      sprite = frames[33];
    } else if (c == 'y') {
      sprite = frames[34];
    } else if (c == 'z') {
      sprite = frames[35];
    } else if (c == ' ') {
      sprite = frames[36];
    } else if (c == '!') {
      sprite = frames[37];
    } else if (c == '\'') {
      sprite = frames[38];
    } else if (c == '-') {
      sprite = frames[40];
    } else if (c == '.') {
      sprite = frames[41];
    } else if (c == ':') {
      sprite = frames[42];
    } else if (c == '=') {
      sprite = frames[43];
    } else if (c != '\u0000') {
      sprite = frames[39];
    }
  }

  void update() {
  };
}
