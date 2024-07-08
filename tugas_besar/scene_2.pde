
//kecepatan jalan
float speedX1 = 6.0;
float speedX2 = 6.0;

//posisi dua orang
float[] posisi1 = {70, 800};
float[] posisi2 = {800, 800};

//posisi ibu dan anak
float[] tujuan_Ibu = {100, 820};
float[] tujuan_Anak_1 = {1, 860};
float[] tujuan_Anak_2 = {200, 860};
//posisi ibu dan anak ke dua
float[] tujuan_Ibu_2 = {400, 820};
float[] tujuan_Anak_1_2 = {1000, 700};
float[] tujuan_Anak_2_2 = {600, 800};
//tujuan_3
float[] tujuan_Ibu_3 = {1500, 700};
float[] tujuan_Anak_1_3 = {800, 650};
float[] tujuan_Anak_2_3 = {1200, 790};

float[] tujuan_Ibu_akhir = {255, 800};
float[] tujuan_Anak_1_akhir = {170, 845};
float[] tujuan_Anak_2_akhir = {85, 845};


//tujuan ibu dan anak
float[] posisi_Ibu = {-150, 820};
float[] posisi_Anak_1 = {-150, 860};
float[] posisi_Anak_2 = {-150, 860};

//tujuan scene 1
float[] target1 = {400, 800};
float[] target2 = {600, 800};

//tujuan scene2
float[] target1_2 = {1200, 800};
float[] target2_2= {1400, 800};

//tujuan scene2
float[] target1_3 = {1000, 800};
float[] target2_3= {1300, 800};

float[] target1_4 = {30, 800};
float[] target2_4= {1830, 800};

float[] target1_akhir = {400, 800};
float[] target2_akhir= {530, 800};

boolean walk_1 = true;
boolean walk_2 = true;
boolean walk_3 = true;
boolean walk_4 = true;
boolean walk_5 = true;

boolean reachedTarget1 = false;
boolean reachedTarget2 = false;
boolean reachedTarget1_2 = false;
boolean reachedTarget2_2 = false;

boolean mirroredActive= true;

//sudut badan
//30-35 yang bagus
float bend = 0;
float bend1 = 0;
float bend2 = 0;


//sudut tangan
//15 bagus
float bendTangan1 = 0;
float bendTangan_anak = 0;
float bendTangan_ibu = 0;

//posisi awan
float cloud1X = 196;
float cloud2X = 1853.1;

void scene1(int seconds) {
  // Update cloud positions for movement
  cloud1X += 0.9; // Adjust the speed as needed
  cloud2X -= 0.9; // Adjust the speed as needed

  // Reset cloud positions if they move off screen
  if (cloud1X > width + 100) {
    cloud1X = -200;
  }
  if (cloud2X < -200) {
    cloud2X = width + 200;
  }

  // Background
  background(255);
  fill(199, 232, 239);
  noStroke();
  rect(0, 0, 1920, 1080);

  // Sea
  calcWave();
  renderWave(580, 0, 171, 191);
  renderWave(620, 51, 181, 197);
  renderWave(660, 102, 192, 204);
  renderWave(700, 153, 213, 220);
  renderWave(740, 204, 234, 237);

  // Left Cloud
  fill(255);
  ellipse(cloud1X, 129, 112, 112);
  ellipse(cloud1X - 50, 179, 100, 100);
  ellipse(cloud1X + 95, 179, 100, 100);
  rect(cloud1X - 50, 129, 145, 100);

  // Sun with gradient color
  int color2 = color(255, 245, 0); // Bright yellow
  int color1 = color(255, 165, 0); // Orange
  int sunDiameter = 200;
  float sunX = 840;
  float sunY = 242;

  for (int r = sunDiameter; r > 0; r--) {
    float inter = map(r, 0, sunDiameter, 0, 1);
    int c = lerpColor(color1, color2, inter);
    fill(c);
    noStroke();
    ellipse(sunX, sunY, r, r);
  }

  // Right Cloud
  fill(255);
  ellipse(cloud2X, 192.897, 183.7948, 183.7948);
  ellipse(cloud2X - 82.05, 274.949, 164.1026, 164.1026);
  ellipse(cloud2X + 155.95, 274.949, 164.1026, 164.1026);
  rect(cloud2X - 82.05, 192.897, 237.949, 164.103);

  // Sand
  fill(255, 234, 179);
  beginShape();
  vertex(0, 779.949);
  bezierVertex(111.5, 761.282, 374.1, 725.749, 532.5, 732.949);
  bezierVertex(730.5, 741.949, 969.5, 752.949, 1173.5, 779.949);
  bezierVertex(1487.5, 810.449, 1594, 840, 1919.5, 779.949);
  vertex(1919.5, 1079.95);
  vertex(0, 1079.95);
  endShape(CLOSE);

  //// Elapsed time display
  //fill(0);
  //textSize(32);
  //text("Elapsed time: " + seconds + " seconds", 50, 50);

  // Random trash
  randomSeed(1);

  int jumlah_sampah = 0;

  if (seconds<112) {
    jumlah_sampah = 100;
  } else {
    jumlah_sampah = 0;
  }

  for (int i = 0; i < jumlah_sampah; i++) {
    float x = random(0, width);
    float y = random(780, 1080);
    bottle(x, y);
  }
  for (int i = 0; i < jumlah_sampah; i++) {
    float x = random(0, width);
    float y = random(780, 1080);
    kaleng(x, y);
  }

  // Draw tree
  pohon(1400, 120);

  // Move characters
  if (!reachedTarget1) {
    moveTowardsTarget(posisi1, target1, speedX1, 1);
  }
  if (!reachedTarget2) {
    moveTowardsTarget(posisi2, target2, speedX2, 2);
  }

  // Character actions
  if (seconds > 46) {
    if (!reachedTarget1) {
      reachedTarget1 = true;
      reachedTarget2 = true;
      walk_1 = true;
      walk_2 = true;
      walk_3 = true;
      walk_4 = true;
      walk_5 = true;
    } else if (seconds > 45 && seconds < 55) {
      if (reachedTarget1_2) {
        moveTowardsTarget(posisi1, target1_2, speedX1, 1);
      }
      if (reachedTarget2_2) {
        moveTowardsTarget(posisi2, target2_2, speedX2, 2);
        mirroredActive = false;
      }
    } else if (seconds > 55 && seconds < 57) {
      bend1 = 35;
      bendTangan1 = 15;
    } else if (seconds < 58) {
      bend1 = 0;
      bendTangan1 = 0;
    } else if (seconds > 58 && seconds < 61.5) {
      if (reachedTarget1_2) {
        moveTowardsTarget(posisi1, target1_3, speedX1, 1);
      }
      if (reachedTarget2_2) {
        mirroredActive = true;
        moveTowardsTarget(posisi2, target2_3, speedX2, 2);
      }
    } else if (seconds > 61 && seconds < 63) {
      bend1 = 35;
      bendTangan1 = 15;
    } else if (seconds < 64) {
      bend1 = 0;
      bendTangan1 = 0;
    } else if (seconds > 64 && seconds < 70) {
      if (reachedTarget1_2 && reachedTarget2_2) {
        moveTowardsTarget(posisi_Anak_1, tujuan_Anak_1, speedX2, 3);
        moveTowardsTarget(posisi_Anak_2, tujuan_Anak_2, speedX2, 4);
        moveTowardsTarget(posisi_Ibu, tujuan_Ibu, speedX2, 5);
      }
    } else if (seconds >= 70 && seconds < 72) {
      bendTangan_ibu = 60;
    } else if (seconds < 73) {
      bendTangan_ibu = 0;
    } else if (seconds > 74 && seconds < 87) {
      walk_1 = true;
      walk_2 = true;
      walk_3 = true;
      walk_4 = true;
      walk_5 = true;
      if (reachedTarget1_2) {
        moveTowardsTarget(posisi1, target1_4, speedX1, 1);
      }
      if (reachedTarget2_2) {
        mirroredActive = true;
        moveTowardsTarget(posisi2, target2_4, speedX2, 2);
      }
      if (reachedTarget1_2 && reachedTarget2_2) {
        moveTowardsTarget(posisi_Anak_1, tujuan_Anak_1_2, speedX2, 3);
        moveTowardsTarget(posisi_Anak_2, tujuan_Anak_2_2, speedX2, 4);
        moveTowardsTarget(posisi_Ibu, tujuan_Ibu_2, speedX2, 5);
      }
    } else if (seconds > 87 && seconds < 89) {
      bend1 = 35;
      bendTangan1 = 15;

      bend = 35;
      bendTangan_anak = 15;
      bendTangan_ibu = 15;
    } else if (seconds < 90) {
      bend1 = 0;
      bendTangan1 = 0;
      bend = 0;

      bendTangan_anak = 0;
      bendTangan_ibu = 0  ;
    } else if (seconds > 90 && seconds < 104) {
      if (reachedTarget1_2 && reachedTarget2_2) {
        moveTowardsTarget(posisi_Anak_1, tujuan_Anak_1_3, speedX2, 3);
        moveTowardsTarget(posisi_Anak_2, tujuan_Anak_2_3, speedX2, 4);
        moveTowardsTarget(posisi_Ibu, tujuan_Ibu_3, speedX2, 5);
      }
    } else if (seconds > 105 && seconds < 107) {
      bend1 = 35;
      bendTangan1 = 15;

      bend = 35;
      bendTangan_anak = 15;
      bendTangan_ibu = 15;
    } else if (seconds < 108) {
      bend1 = 0;
      bendTangan1 = 0;
      bend = 0;

      bendTangan_anak = 0;
      bendTangan_ibu = 0  ;
    } else if (seconds > 109) {
      walk_1 = true;
      walk_2 = true;
      walk_3 = true;
      walk_4 = true;
      walk_5 = true;
      if (reachedTarget1_2) {
        moveTowardsTarget(posisi1, target1_akhir, 15, 1);
      }
      if (reachedTarget2_2) {
        mirroredActive = false;
        moveTowardsTarget(posisi2, target2_akhir, 15, 2);
      }
      if (reachedTarget1_2 && reachedTarget2_2) {
        moveTowardsTarget(posisi_Anak_1, tujuan_Anak_1_akhir, 15, 3);
        moveTowardsTarget(posisi_Anak_2, tujuan_Anak_2_akhir, 15, 4);
        moveTowardsTarget(posisi_Ibu, tujuan_Ibu_akhir, 15, 5);
      }
    }
  }




  // Draw characters
  float scaleFactor = 0.7;
  float scaleFactorKecil = 0.6;
  color personColor2 = color(255, 183, 197);
  color personColor3 = color(4, 156, 174);

  // Person 1
  color personColor1 = color(154, 231, 251); // Light blue color
  drawPerson(posisi1[0], posisi1[1], scaleFactor, false, personColor1, walk_1, bend1, bendTangan1);

  // Person 2
  // Light pink color
  drawPerson(posisi2[0], posisi2[1], scaleFactor, mirroredActive, personColor3, walk_2, bend1, bendTangan1);



  // Child 1
  drawPerson(posisi_Anak_1[0], posisi_Anak_1[1], scaleFactorKecil, false, personColor1, walk_4, bend, bendTangan_anak);

  // Child 2
  drawPerson(posisi_Anak_2[0], posisi_Anak_2[1], scaleFactorKecil, false, personColor1, walk_3, bend, bendTangan_anak);

  // Mother
  drawPerson(posisi_Ibu[0], posisi_Ibu[1], scaleFactor, false, personColor2, walk_5, bend, bendTangan_ibu);

  if (seconds>109 && seconds <116) {
    fill(0);
    rect(0, 0, 1920, 1080);
    fill(255);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Beberapa Jam Kemudian ...", width / 2, height / 2);
  }
    if (seconds>137 && seconds <140) {
    fill(0);
    rect(0, 0, 1920, 1080);
    fill(255);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Terima kasih", width / 2, height / 2);
  }
}
