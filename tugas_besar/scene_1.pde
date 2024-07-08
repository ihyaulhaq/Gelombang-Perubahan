PImage img;

Fish[] fishes;
int numFishes = 20;  // Number of fish


void scene2() {
  // Draw the image for the second scene
  image(img, 0, 0, width, height);
  
  calcWave();

  for (int i = 0; i < fishes.length; i++) {
    float waveHeight = calcFishWave(fishes[i].waveOffset);
    fishes[i].update(waveHeight);
    fishes[i].display();
  }
}

class Fish {
  float x, y;
  float speed;
  float waveOffset;

  Fish(float x, float y, float speed, float waveOffset) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.waveOffset = waveOffset;
  }

  void update(float waveHeight) {
    x -= speed;
    y += waveHeight;
    if (x < -100) {
      x = width / 0.1 + 100;
      y = random(height/2,height) * 10;
    }
  }

  void display() {
    drawFish(x, y, 0.1);
  }
}
