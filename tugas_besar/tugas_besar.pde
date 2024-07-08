import ddf.minim.*;


Minim minim;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;
AudioPlayer player10;
AudioPlayer player11;

int startTime1 = 0;  // Bekson start
int stopTime1 = 9 ;  // Stop

int startTime2 = 10;  // Narator 1 Start
int stopTime2 = 31 ;  // Stop

int startTime3 = 37 ;  // Pria 1 Start
int stopTime3 = 41 ;  // Stop

float startTime4 = 40.5 ;  // Pria 2 Start
int stopTime4 = 46;  // Stop

int startTime5 = 55 ;  // Pria 1 Start
int stopTime5 = 60 ;  // Stop

int startTime6 = 61 ;  // Pria 2 Start
int stopTime6 = 67 ;  // Stop

int startTime7 = 70 ;  // Ibu start
int stopTime7 = 76;  // Stop

int startTime8 = 77;  // Narator 2 Start
int stopTime8 = 85 ;  // Stop

int startTime9 = 91 ;  // Pria 1 Start
int stopTime9 = 95;  // Stop

int startTime10 = 96 ;  // Pria 2 Start
int stopTime10 = 102 ;  // Stop

float startTime11 = 115.5;  // Narator 3 Start
int stopTime11 = 136;  // Stop

boolean started1 = false;
boolean stopped1 = false;

boolean started2 = false;
boolean stopped2 = false;

boolean started3 = false;
boolean stopped3 = false;

boolean started4 = false;
boolean stopped4 = false;

boolean started5 = false;
boolean stopped5 = false;

boolean started6 = false;
boolean stopped6 = false;

boolean started7 = false;
boolean stopped7 = false;

boolean started8 = false;
boolean stopped8 = false;

boolean started9 = false;
boolean stopped9 = false;

boolean started10 = false;
boolean stopped10 = false;

boolean started11 = false;
boolean stopped11 = false;




int startTime; // Waktu awal timer
int currentTime; // Waktu saat ini
int elapsedTime; // Waktu yang telah berlalu


void setup() {
  //gambar1
  img= loadImage("D:/kuliah/semester 4/GMM/tubes/scene__1.jpg");

  size(1920, 1080);
  background(255);
  startTime = millis();

  //gelombang
  w = width + 16;

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(1, 5);
    float period = random(100, 300); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing;
  }

  yvalues = new float[w / xspacing];
  
  //ikan gerak
  fishes = new Fish[numFishes];
  for (int i = 0; i < numFishes; i++) {
    fishes[i] = new Fish(random(width) * 10, random(height/2,height) * 10, 100, random(TWO_PI));
  }

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(1, 6);
    float period = random(100, 300); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing;
  }

  yvalues = new float[w / xspacing];


  //backsound
  minim = new Minim(this);
  player1 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/music_fx_backsound_for_sad.mp3");
  player2 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 1 (Narator).mp3");
  player3 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 2.1 (Pria 1).mp3");
  player4 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 2.2 (Pria 2).mp3");
  player5 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 3.1 (Pria 1).mp3");
  player6 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 3.2 (Pria 2).mp3");
  player7 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 4.1 (Ibu).mp3");
  player8 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 4.2 (Narator).mp3");
  player9 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 5.1 (Pria 1).mp3");
  player10 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 5.2 (Pria 2).mp3");
  player11 = minim.loadFile("D:/kuliah/semester 4/GMM/tubes/sceen_1/Audio Gmm/Scene 6 (Narator).mp3");
}

void draw() {
  // Hitung waktu yang telah berlalu
  currentTime = millis();
  elapsedTime = currentTime - startTime;

  // Konversi waktu yang telah berlalu ke detik
  int seconds = elapsedTime / 1000;
  int sceneSwitchSeconds = 32;

  if (seconds < sceneSwitchSeconds) {
    scene2();
  } else {
    scene1(seconds);
  }

//  fill(0);
//  textSize(32);
//  text("Elapsed time: " + seconds + " seconds", 50, 50);

   // Start and stop player1
  if (!started1 && seconds >= startTime1) {
    player1.cue(0);  // Cue to the beginning of the audio
    player1.play();
    started1 = true;
  }
  if (!stopped1 && seconds >= stopTime1) {
    player1.pause();
    stopped1 = true;
  }

  // Start and stop player2
  if (!started2 && seconds >= startTime2) {
    player2.cue(0);  // Cue to the beginning of the audio
    player2.play();
    started2 = true;
  }
  if (!stopped2 && seconds >= stopTime2) {
    player2.pause();
    stopped2 = true;
  }

  // Start and stop player3
  if (!started3 && seconds >= startTime3) {
    player3.cue(0);  // Cue to the beginning of the audio
    player3.play();
    started3 = true;
  }
  if (!stopped3 && seconds >= stopTime3) {
    player3.pause();
    stopped3 = true;
  }

  // Start and stop player4
  if (!started4 && seconds >= startTime4) {
    player4.cue(0);  // Cue to the beginning of the audio
    player4.play();
    started4 = true;
  }
  if (!stopped4 && seconds >= stopTime4) {
    player4.pause();
    stopped4 = true;
  }

    // Start and stop player5
  if (!started5 && seconds >= startTime5) {
    player5.cue(0);  // Cue to the beginning of the audio
    player5.play();
    started5 = true;
  }
  if (!stopped5 && seconds >= stopTime5) {
    player5.pause();
    stopped5 = true;
  }

  // Start and stop player6
  if (!started6 && seconds >= startTime6) {
    player6.cue(0);  // Cue to the beginning of the audio
    player6.play();
    started6 = true;
  }
  if (!stopped6 && seconds >= stopTime6) {
    player6.pause();
    stopped6 = true;
  }

    // Start and stop player7
  if (!started7 && seconds >= startTime7) {
    player7.cue(0);  // Cue to the beginning of the audio
    player7.play();
    started7 = true;
  }
  if (!stopped7 && seconds >= stopTime7) {
    player7.pause();
    stopped7 = true;
  }

  // Start and stop player8
  if (!started8 && seconds >= startTime8) {
    player8.cue(0);  // Cue to the beginning of the audio
    player8.play();
    started8 = true;
  }
  if (!stopped8 && seconds >= stopTime8) {
    player8.pause();
    stopped8 = true;
  }

  // Start and stop player9
  if (!started9 && seconds >= startTime9) {
    player9.cue(0);  // Cue to the beginning of the audio
    player9.play();
    started9 = true;
  }
  if (!stopped9 && seconds >= stopTime9) {
    player9.pause();
    stopped9 = true;
  }

  // Start and stop player10
  if (!started10 && seconds >= startTime10) {
    player10.cue(0);  // Cue to the beginning of the audio
    player10.play();
    started10 = true;
  }
  if (!stopped10 && seconds >= stopTime10) {
    player10.pause();
    stopped10 = true;
  }

    // Start and stop player11
  if (!started11 && seconds >= startTime11) {
    player11.cue(0);  // Cue to the beginning of the audio
    player11.play();
    started11 = true;
  }
  if (!stopped11 && seconds >= stopTime11) {
    player11.pause();
    stopped11 = true;
  }
}

void stop() {
  player1.close();
  player2.close();
  player3.close();
  player4.close();
  player5.close();
  player6.close();
  player7.close();
  player8.close();
  player9.close();
  player10.close();
  player11.close();
  minim.stop();
  super.stop();
}
