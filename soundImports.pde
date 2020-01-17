SoundFile footstep;
SoundFile hoe;
SoundFile wall;
SoundFile pick;
SoundFile gamestart;
SoundFile hoebreaking;
SoundFile menuback;
SoundFile menuopen;
SoundFile menuselect;
SoundFile movecurs;
SoundFile hoebreak;
SoundFile bgm;                                          //send finished game to juhani.junkala@musician.org!

void importSounds(){

  footstep = new SoundFile(this, "footstep.wav");
  hoe = new SoundFile(this, "hoe.wav");
  wall = new SoundFile(this, "wall.wav");
  pick = new SoundFile(this, "pick.wav");
  gamestart = new SoundFile(this, "gamestart.wav");
  hoebreaking = new SoundFile(this, "hoebreaking.wav");
  menuback = new SoundFile(this, "menuback.wav");
  menuopen = new SoundFile(this, "menuopen.wav");
  menuselect = new SoundFile(this, "menuselect.wav");
  movecurs = new SoundFile(this, "movecurs.wav");
  hoebreak = new SoundFile(this, "hoebreak.wav");
  bgm = new SoundFile(this, "bgm.wav");
};
