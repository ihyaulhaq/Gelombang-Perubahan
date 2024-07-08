void drawPerson(float offsetX, float offsetY, float scaleFactor, boolean mirroredActive, color personColor, boolean walk, float bendAngle, float handAngle) {
  currentTime = millis();
  elapsedTime = currentTime - startTime;

  // Konversi waktu yang telah berlalu ke detik
  int seconds = elapsedTime / 1000;

  pushMatrix();
  translate(offsetX, offsetY);
  if (mirroredActive) {
    scale(-scaleFactor, scaleFactor);
    translate(-85, 0); // Adjust to mirror correctly based on person's width
  } else {
    scale(scaleFactor);
  }

  float walkCycle;
  float walkCycle2;


  if (walk) {
    // Calculate walking animation phase
    walkCycle = (seconds % 2 == 0) ? 15 : 0; // Alternates leg positions
    walkCycle2 = (seconds % 2== 0) ? 0 : 15;
  } else {
    walkCycle = 0;
    walkCycle2 = 0;
  }

  // Set the person's color
  strokeWeight(5);

  // Apply bending angle

  if (bendAngle != 0) {
    pushMatrix();
    translate(120, 140); // Adjust to the body's rotation center
    rotate(radians(bendAngle));
    translate(-80, -140);
  }


  // Draw the the hand
  // Draw hand with rotation
  if (handAngle!=0) {
    pushMatrix();
    translate(120, 140); // Adjust the pivot point for hand rotation
    rotate(radians(-handAngle));
    translate(-110, -140);
  }
  beginShape();
  fill(personColor);
  stroke(0);
  vertex(177.85, 217.916);
  bezierVertex(135.929, 223.426, 137.355, 125.226, 135.159, 103.629);
  vertex(135.159, 103.629);
  bezierVertex(158.358, 99.0548, 162.586, 118.47, 166.814, 137.884);
  bezierVertex(199.5, 215.07, 177.85, 217.916, 177.85, 217.916);
  endShape(CLOSE);

  if (handAngle != 0) {
    popMatrix();
  }

  // Draw badan
  beginShape();
  fill(personColor);
  stroke(0);
  vertex(160.5, 145.5);
  bezierVertex(160.5, 180.86, 156.001, 212.482, 143.858, 235.184);
  bezierVertex(137.809, 246.494, 129.89, 255.54, 119.718, 261.77);
  bezierVertex(109.55, 267.997, 96.9854, 271.5, 81.5, 271.5);
  bezierVertex(66.0146, 271.5, 53.4499, 267.997, 43.2823, 261.77);
  bezierVertex(33.1104, 255.54, 25.1912, 246.494, 19.142, 235.184);
  bezierVertex(6.99948, 212.482, 2.5, 180.86, 2.5, 145.5);
  bezierVertex(2.5, 109.867, 2.53319, 73.9992, 12.5318, 47.0051);
  bezierVertex(17.5001, 33.592, 24.8798, 22.5284, 35.8252, 14.7963);
  bezierVertex(46.7688, 7.06557, 61.511, 2.5, 81.5, 2.5);
  bezierVertex(101.489, 2.5, 116.231, 7.06557, 127.175, 14.7963);
  bezierVertex(138.12, 22.5284, 145.5, 33.592, 150.468, 47.0051);
  bezierVertex(160.467, 73.9992, 160.5, 109.867, 160.5, 145.5);
  endShape(CLOSE);

  // Draw tangan kanan
  beginShape();
  noFill();
  stroke(0);
  vertex(20.9768, 106.867);
  bezierVertex(9.99997, 121.5, 31.4906, 221.462, 58.611, 222.917);
  bezierVertex(95.8052, 224.912, 51.0979, 142.478, 47.7264, 122.897);
  endShape();


  // Draw the circles
  fill(0);
  ellipse(76, 56, 5, 5);
  ellipse(130, 56, 5, 5);

  // Draw the horizontal line
  strokeWeight(3);
  line(100, 85, 113, 85);

  // End body bending rotation
  if (bendAngle != 0) {
    popMatrix();
  }

  // Draw the feet shapes
  strokeWeight(5);

  // Left foot
  pushMatrix();
  translate(50, 225);
  rotate(radians(walkCycle));
  beginShape();
  fill(personColor);
  vertex(-17.6777, 0);
  bezierVertex(-23.1777, 21, -29.5834, 82.517, -7.67648, 86.5);
  bezierVertex(5.52352, 88.9, 6.4889, 50.667, 9.32226, 31);
  endShape();
  popMatrix();

  // Right foot
  pushMatrix();
  translate(115, 225);
  rotate(radians(walkCycle2));
  beginShape();
  fill(personColor);
  vertex(17, 0);
  bezierVertex(22.5, 21, 28.906, 82.517, 7, 86.5);
  bezierVertex(-6.20001, 88.9, -7.16667, 50.667, -10, 31);
  endShape();
  popMatrix();

  if (seconds<112) {
    kantongSampah(1, 140);
  }


  popMatrix();
}

//fungsi buat gambar botol
void bottle(float posX, float posY) {
  pushMatrix();
  translate(posX, posY);

  // Path 1
  fill(198, 235, 228);
  beginShape();
  vertex(42.7022, 7.65542);
  bezierVertex(43.9114, 5.18204, 47.7588, 5.14767, 50.2322, 6.35686);
  bezierVertex(52.7056, 7.56606, 55.8341, 10.6137, 54.878, 13.2713);
  bezierVertex(54.8444, 13.3648, 54.8051, 13.4578, 54.7599, 13.5502);
  bezierVertex(54.6972, 13.6784, 54.6313, 13.8012, 54.5622, 13.9187);
  vertex(48.2679, 26.819);
  bezierVertex(46.7836, 29.8611, 48.1927, 33.5215, 49.0263, 36.8021);
  bezierVertex(49.3583, 38.1086, 49.3082, 39.5892, 48.5422, 41.1559);
  vertex(27.9921, 83.1907);
  bezierVertex(26.8707, 85.4846, 24.5709, 87.0131, 22.0203, 86.8937);
  bezierVertex(14.1799, 86.5267, 9.72414, 84.1094, 4.96873, 78.5608);
  bezierVertex(3.29393, 76.6066, 3.07579, 73.8228, 4.20616, 71.5107);
  vertex(24.736, 29.5174);
  bezierVertex(25.1304, 28.5967, 25.9319, 27.3895, 27.1206, 26.5212);
  bezierVertex(30.1902, 24.279, 34.9867, 23.4374, 36.6562, 20.0223);
  vertex(42.7022, 7.65542);
  endShape(CLOSE);

  // Path 2
  noFill();
  stroke(0);
  strokeWeight(0.344142);
  beginShape();
  vertex(42.7022, 7.65542);
  bezierVertex(43.9114, 5.18204, 47.7588, 5.14767, 50.2322, 6.35686);
  bezierVertex(52.7056, 7.56606, 55.8341, 10.6137, 54.878, 13.2713);
  endShape();

  beginShape();
  vertex(42.7022, 7.65542);
  bezierVertex(41.1907, 10.7471, 42.9083, 13.5022, 46, 15.0137);
  bezierVertex(49.1072, 16.5327, 53.0973, 16.9511, 54.7599, 13.5502);
  bezierVertex(54.8051, 13.4578, 54.8444, 13.3648, 54.878, 13.2713);
  endShape();

  beginShape();
  vertex(42.7022, 7.65542);
  vertex(36.6562, 20.0223);
  bezierVertex(34.9867, 23.4374, 30.1902, 24.279, 27.1206, 26.5212);
  bezierVertex(25.9319, 27.3895, 25.1304, 28.5967, 24.736, 29.5174);
  vertex(4.20616, 71.5107);
  bezierVertex(3.07579, 73.8228, 3.29393, 76.6066, 4.96873, 78.5608);
  bezierVertex(9.72414, 84.1094, 14.1799, 86.5267, 22.0203, 86.8937);
  bezierVertex(24.5709, 87.0131, 26.8707, 85.4846, 27.9921, 83.1907);
  bezierVertex(35.0132, 68.8293, 46.6608, 45.0043, 48.5422, 41.1559);
  bezierVertex(49.3082, 39.5892, 49.3583, 38.1086, 49.0263, 36.8021);
  bezierVertex(48.1927, 33.5215, 46.7836, 29.8611, 48.2679, 26.819);
  vertex(54.878, 13.2713);
  endShape();

  // Path 3
  fill(0, 153, 124);
  beginShape();
  vertex(17.0034, 54.3448);
  vertex(25.3171, 37.3393);
  bezierVertex(28.3364, 40.1652, 30.8442, 41.9834, 33.4779, 43.2262);
  bezierVertex(36.1026, 44.4649, 38.8426, 45.1273, 42.3209, 45.6539);
  vertex(34.0057, 62.6624);
  bezierVertex(30.1326, 62.741, 27.2621, 62.3498, 24.6758, 61.1042);
  bezierVertex(22.0863, 59.857, 19.7633, 57.7446, 17.0034, 54.3448);
  endShape(CLOSE);

  // Outline for Path 3
  noFill();
  stroke(0);
  strokeWeight(0.344142);
  beginShape();
  vertex(17.0034, 54.3448);
  vertex(25.3171, 37.3393);
  bezierVertex(28.3364, 40.1652, 30.8442, 41.9834, 33.4779, 43.2262);
  bezierVertex(36.1026, 44.4649, 38.8426, 45.1273, 42.3209, 45.6539);
  vertex(34.0057, 62.6624);
  bezierVertex(30.1326, 62.741, 27.2621, 62.3498, 24.6758, 61.1042);
  bezierVertex(22.0863, 59.857, 19.7633, 57.7446, 17.0034, 54.3448);
  endShape();

  popMatrix();
}

//fungsi gambar kaleng

void kaleng(float x, float y) {
  // Set the translation to the desired position
  translate(x, y);

  // Draw the path
  beginShape();
  fill(154, 231, 251);
  stroke(0);
  strokeWeight(0.344142);
  vertex(13.2083, 5.09808);
  bezierVertex(16.6911, 3.83097, 19.97, 3.08273, 22.4481, 2.8891);
  bezierVertex(23.6908, 2.792, 24.7028, 2.83687, 25.429, 3.00858);
  bezierVertex(26.179, 3.1859, 26.4858, 3.46153, 26.5743, 3.70471);
  bezierVertex(26.6628, 3.94789, 26.6048, 4.35627, 26.1441, 4.97403);
  bezierVertex(25.6979, 5.57228, 24.9514, 6.25693, 23.9368, 6.98104);
  bezierVertex(21.9136, 8.42502, 18.9204, 9.95861, 15.4375, 11.2257);
  bezierVertex(11.9547, 12.4928, 8.67577, 13.2411, 6.19769, 13.4347);
  bezierVertex(4.95502, 13.5318, 3.94303, 13.4869, 3.21677, 13.3152);
  bezierVertex(2.46682, 13.1379, 2.15996, 12.8623, 2.07148, 12.6191);
  bezierVertex(1.98301, 12.3759, 2.04103, 11.9675, 2.50172, 11.3498);
  bezierVertex(2.94786, 10.7515, 3.69444, 10.0669, 4.70901, 9.34277);
  bezierVertex(6.73219, 7.89879, 9.72536, 6.36519, 13.2083, 5.09808);
  endShape(CLOSE);

  // Draw the rotated rectangle
  pushMatrix();
  translate(19.8569, 62.9688);
  rotate(radians(-109.992));
  fill(154, 231, 251);
  rect(0, 0, 53.396, 27.074);
  popMatrix();

  // Draw the rotated ellipse
  pushMatrix();
  translate(32.8356, 59.0472);
  rotate(radians(-109.992));
  fill(255);
  ellipse(0, 0, 3.76028 * 2, 13.537 * 2);  // Multiply by 2 because ellipse() uses diameter
  popMatrix();

  // Reset the translation
  translate(-x, -y);
}
void pohon(float offsetX, float offsetY) {
  // Path 1
  beginShape();
  fill(#4A8D00);
  vertex(133 + offsetX, 190.878 + offsetY);
  bezierVertex(157.8 + offsetX, 167.278 + offsetY, 226 + offsetX, 148.712 + offsetY, 257 + offsetX, 142.378 + offsetY);
  bezierVertex(249.333 + offsetX, 164.212 + offsetY, 237.5 + offsetX, 215.878 + offsetY, 229 + offsetX, 230.878 + offsetY);
  bezierVertex(219.717 + offsetX, 247.261 + offsetY, 192.333 + offsetX, 278.212 + offsetY, 176.5 + offsetX, 290.378 + offsetY);
  bezierVertex(178.167 + offsetX, 275.545 + offsetY, 180.5 + offsetX, 245.678 + offsetY, 176.5 + offsetX, 244.878 + offsetY);
  bezierVertex(171.5 + offsetX, 243.878 + offsetY, 167.5 + offsetX, 269.378 + offsetY, 157.5 + offsetX, 284.378 + offsetY);
  bezierVertex(149.5 + offsetX, 296.378 + offsetY, 115.833 + offsetX, 312.712 + offsetY, 100 + offsetX, 319.378 + offsetY);
  bezierVertex(100.667 + offsetX, 286.378 + offsetY, 108.2 + offsetX, 214.478 + offsetY, 133 + offsetX, 190.878 + offsetY);
  endShape(CLOSE);

  // Path 2
  beginShape();
  fill(#8FD02C);
  vertex(173.5 + offsetX, 214.878 + offsetY);
  bezierVertex(195.5 + offsetX, 189.378 + offsetY, 229 + offsetX, 162.378 + offsetY, 257 + offsetX, 142.378 + offsetY);
  bezierVertex(249.333 + offsetX, 164.212 + offsetY, 237.5 + offsetX, 215.878 + offsetY, 229 + offsetX, 230.878 + offsetY);
  bezierVertex(219.717 + offsetX, 247.261 + offsetY, 192.333 + offsetX, 278.212 + offsetY, 176.5 + offsetX, 290.378 + offsetY);
  bezierVertex(178.167 + offsetX, 275.545 + offsetY, 180.5 + offsetX, 245.678 + offsetY, 176.5 + offsetX, 244.878 + offsetY);
  bezierVertex(171.5 + offsetX, 243.878 + offsetY, 167.5 + offsetX, 269.378 + offsetY, 157.5 + offsetX, 284.378 + offsetY);
  bezierVertex(149.5 + offsetX, 296.378 + offsetY, 115.833 + offsetX, 312.712 + offsetY, 100 + offsetX, 319.378 + offsetY);
  bezierVertex(114.5 + offsetX, 281.878 + offsetY, 151.137 + offsetX, 240.799 + offsetY, 173.5 + offsetX, 214.878 + offsetY);
  endShape(CLOSE);

  // Path 3
  beginShape();
  fill(#4A8D00);
  vertex(263.501 + offsetX, 17.8782 + offsetY);
  bezierVertex(230.301 + offsetX, 41.0782 + offsetY, 246.001 + offsetX, 110.212 + offsetY, 258.001 + offsetX, 141.878 + offsetY);
  bezierVertex(268.168 + offsetX, 132.211 + offsetY, 298.201 + offsetX, 106.978 + offsetY, 337.001 + offsetX, 83.378 + offsetY);
  bezierVertex(385.501 + offsetX, 53.878 + offsetY, 442.501 + offsetX, 65.378 + offsetY, 441.501 + offsetX, 60.378 + offsetY);
  bezierVertex(440.501 + offsetX, 55.378 + offsetY, 395.001 + offsetX, 17.8786 + offsetY, 352.501 + offsetX, 3.87819 + offsetY);
  bezierVertex(352.501 + offsetX, 3.87819 + offsetY, 305.001 + offsetX, -11.1218 + offsetY, 263.501 + offsetX, 17.8782 + offsetY);
  endShape(CLOSE);

  // Path 4
  beginShape();
  fill(#8FD02C);
  vertex(304.999 + offsetX, 52.3765 + offsetY);
  bezierVertex(293.552 + offsetX, 60.3761 + offsetY, 246 + offsetX, 110.209 + offsetY, 258 + offsetX, 141.876 + offsetY);
  bezierVertex(268.167 + offsetX, 132.209 + offsetY, 298.2 + offsetX, 106.976 + offsetY, 337 + offsetX, 83.3758 + offsetY);
  bezierVertex(385.5 + offsetX, 53.8758 + offsetY, 442.5 + offsetX, 65.3758 + offsetY, 441.5 + offsetX, 60.3758 + offsetY);
  bezierVertex(430.5 + offsetX, 56.3767 + offsetY, 400.6 + offsetX, 47.0784 + offsetY, 369 + offsetX, 41.8784 + offsetY);
  bezierVertex(337.4 + offsetX, 36.6784 + offsetY, 313.166 + offsetX, 46.7105 + offsetY, 304.999 + offsetX, 52.3765 + offsetY);
  endShape(CLOSE);

  // Path 6
  beginShape();
  fill(#4A8D00);
  vertex(392.5 + offsetX, 152.878 + offsetY);
  bezierVertex(340.987 + offsetX, 125.163 + offsetY, 308.5 + offsetX, 136.878 + offsetY, 258 + offsetX, 141.878 + offsetY);
  bezierVertex(266.667 + offsetX, 152.045 + offsetY, 291.8 + offsetX, 177.178 + offsetY, 323 + offsetX, 196.378 + offsetY);
  bezierVertex(354.2 + offsetX, 215.578 + offsetY, 401 + offsetX, 215.712 + offsetY, 420.5 + offsetX, 213.378 + offsetY);
  bezierVertex(412.333 + offsetX, 203.878 + offsetY, 396.7 + offsetX, 184.278 + offsetY, 399.5 + offsetX, 181.878 + offsetY);
  bezierVertex(402.3 + offsetX, 179.478 + offsetY, 421.333 + offsetX, 201.878 + offsetY, 430.5 + offsetX, 213.378 + offsetY);
  bezierVertex(458.333 + offsetX, 233.878 + offsetY, 514 + offsetX, 273.578 + offsetY, 514 + offsetX, 268.378 + offsetY);
  bezierVertex(514 + offsetX, 261.878 + offsetY, 456 + offsetX, 187.042 + offsetY, 392.5 + offsetX, 152.878 + offsetY);
  endShape(CLOSE);

  // Path 7
  beginShape();
  fill(#8FD02C);
  vertex(154.5 + offsetX, 26.8783 + offsetY);
  bezierVertex(216.5 + offsetX, 17.2783 + offsetY, 249.333 + offsetX, 99.545 + offsetY, 258 + offsetX, 141.878 + offsetY);
  vertex(121 + offsetX, 148.378 + offsetY);
  vertex(138.5 + offsetX, 118.878 + offsetY);
  vertex(100.5 + offsetX, 148.378 + offsetY);
  vertex(0 + offsetX, 162.878 + offsetY);
  bezierVertex(25.6667 + offsetX, 121.545 + offsetY, 92.5 + offsetX, 36.4783 + offsetY, 154.5 + offsetX, 26.8783 + offsetY);
  endShape(CLOSE);

  // Path 8
  beginShape();
  fill(#4A8D00);
  vertex(156.5 + offsetX, 79.3779 + offsetY);
  bezierVertex(197 + offsetX, 73.1074 + offsetY, 249.333 + offsetX, 99.5454 + offsetY, 258 + offsetX, 141.879 + offsetY);
  vertex(121 + offsetX, 148.379 + offsetY);
  vertex(138.5 + offsetX, 118.879 + offsetY);
  vertex(100.5 + offsetX, 148.379 + offsetY);
  vertex(0 + offsetX, 162.879 + offsetY);
  bezierVertex(59 + offsetX, 118.879 + offsetY, 94.4999 + offsetX, 88.9773 + offsetY, 156.5 + offsetX, 79.3779 + offsetY);
  endShape(CLOSE);

  // Path 9
  beginShape();
  fill(#633311);
  vertex(338.5 + offsetX, 493.878 + offsetY);
  bezierVertex(338.5 + offsetX, 527.878 + offsetY, 324.5 + offsetX, 583.712 + offsetY, 316.5 + offsetX, 616.878 + offsetY);
  bezierVertex(319.667 + offsetX, 625.878 + offsetY, 293 + offsetX, 672.778 + offsetY, 303 + offsetX, 674.378 + offsetY);
  bezierVertex(355.5 + offsetX, 682.778 + offsetY, 357 + offsetX, 633.878 + offsetY, 367 + offsetX, 616.878 + offsetY);
  bezierVertex(377 + offsetX, 599.878 + offsetY, 387.805 + offsetX, 520.785 + offsetY, 389.5 + offsetX, 486.878 + offsetY);
  bezierVertex(391 + offsetX, 456.878 + offsetY, 380 + offsetX, 375.045 + offsetY, 372.5 + offsetX, 335.878 + offsetY);
  vertex(338.5 + offsetX, 362.878 + offsetY);
  bezierVertex(337.833 + offsetX, 398.712 + offsetY, 338.5 + offsetX, 475.01 + offsetY, 338.5 + offsetX, 493.878 + offsetY);
  endShape(CLOSE);

  // Path 10
  stroke(#EEEEEE);
  strokeWeight(2);
  line(257.5 + offsetX, 674.878 + offsetY, 229.044 + offsetX, 639.378 + offsetY);
  line(207 + offsetX, 611.878 + offsetY, 229.044 + offsetX, 639.378 + offsetY);
  line(229.044 + offsetX, 639.378 + offsetY, 225 + offsetX, 607.378 + offsetY);

  // Path 11
  stroke(#EEEEEE);
  strokeWeight(2);
  line(328 + offsetX, 685.378 + offsetY, 347.5 + offsetX, 652.878 + offsetY);
  line(347.5 + offsetX, 652.878 + offsetY, 376.5 + offsetX, 619.378 + offsetY);

  // Path 12
  beginShape();
  fill(#8FD02C);
  vertex(385.758 + offsetX, 240.878 + offsetY);
  bezierVertex(377.758 + offsetX, 207.278 + offsetY, 296.758 + offsetX, 160.545 + offsetY, 257.258 + offsetX, 141.378 + offsetY);
  bezierVertex(243.092 + offsetX, 174.545 + offsetY, 224.758 + offsetX, 248.878 + offsetY, 264.758 + offsetX, 280.878 + offsetY);
  bezierVertex(304.758 + offsetX, 312.878 + offsetY, 339.092 + offsetX, 366.545 + offsetY, 351.258 + offsetX, 389.378 + offsetY);
  bezierVertex(366.092 + offsetX, 353.878 + offsetY, 393.758 + offsetX, 274.478 + offsetY, 385.758 + offsetX, 240.878 + offsetY);
  endShape(CLOSE);

  // Path 13
  beginShape();
  fill(#4A8D00);
  vertex(318 + offsetX, 236.378 + offsetY);
  bezierVertex(285.5 + offsetX, 188.378 + offsetY, 264.501 + offsetX, 148.878 + offsetY, 257.001 + offsetX, 141.378 + offsetY);
  bezierVertex(242.834 + offsetX, 174.545 + offsetY, 224.501 + offsetX, 248.878 + offsetY, 264.501 + offsetX, 280.878 + offsetY);
  bezierVertex(304.501 + offsetX, 312.878 + offsetY, 338.834 + offsetX, 366.545 + offsetY, 351.001 + offsetX, 389.378 + offsetY);
  bezierVertex(365.834 + offsetX, 353.878 + offsetY, 337.365 + offsetX, 264.979 + offsetY, 318 + offsetX, 236.378 + offsetY);
  endShape(CLOSE);

  // Path 14
  beginShape();
  fill(#63B10D);
  vertex(214.158 + offsetX, 705.012 + offsetY);
  bezierVertex(219.358 + offsetX, 723.812 + offsetY, 275.991 + offsetX, 725.845 + offsetY, 303.658 + offsetX, 724.512 + offsetY);
  bezierVertex(304.325 + offsetX, 690.678 + offsetY, 303.658 + offsetX, 622.812 + offsetY, 295.658 + offsetX, 622.012 + offsetY);
  bezierVertex(285.658 + offsetX, 621.012 + offsetY, 294.158 + offsetX, 638.512 + offsetY, 279.658 + offsetX, 640.012 + offsetY);
  bezierVertex(265.158 + offsetX, 641.512 + offsetY, 227.658 + offsetX, 566.512 + offsetY, 221.158 + offsetX, 568.512 + offsetY);
  bezierVertex(214.658 + offsetX, 570.512 + offsetY, 223.658 + offsetX, 585.012 + offsetY, 217.158 + offsetX, 586.012 + offsetY);
  bezierVertex(210.658 + offsetX, 587.012 + offsetY, 172.658 + offsetX, 552.012 + offsetY, 161.658 + offsetX, 575.512 + offsetY);
  bezierVertex(150.658 + offsetX, 599.012 + offsetY, 221.658 + offsetX, 625.012 + offsetY, 221.158 + offsetX, 633.512 + offsetY);
  bezierVertex(220.658 + offsetX, 642.012 + offsetY, 190.658 + offsetX, 639.512 + offsetY, 191.658 + offsetX, 650.012 + offsetY);
  bezierVertex(192.658 + offsetX, 660.512 + offsetY, 253.658 + offsetX, 680.012 + offsetY, 254.158 + offsetX, 688.512 + offsetY);
  bezierVertex(254.658 + offsetX, 697.012 + offsetY, 207.658 + offsetX, 681.512 + offsetY, 214.158 + offsetX, 705.012 + offsetY);
  endShape(CLOSE);

  // Path 15
  beginShape();
  fill(#92CD40);
  vertex(386.658 + offsetX, 704.512 + offsetY);
  bezierVertex(387.858 + offsetX, 714.912 + offsetY, 345.491 + offsetX, 721.179 + offsetY, 324.158 + offsetX, 723.012 + offsetY);
  bezierVertex(316.825 + offsetX, 705.345 + offsetY, 303.658 + offsetX, 669.812 + offsetY, 309.658 + offsetX, 669.012 + offsetY);
  bezierVertex(317.158 + offsetX, 668.012 + offsetY, 317.158 + offsetX, 678.512 + offsetY, 327.158 + offsetX, 676.512 + offsetY);
  bezierVertex(337.158 + offsetX, 674.512 + offsetY, 328.658 + offsetX, 631.512 + offsetY, 337.158 + offsetX, 627.512 + offsetY);
  bezierVertex(345.658 + offsetX, 623.512 + offsetY, 341.158 + offsetX, 644.012 + offsetY, 348.658 + offsetX, 642.512 + offsetY);
  bezierVertex(356.158 + offsetX, 641.012 + offsetY, 363.658 + offsetX, 604.512 + offsetY, 369.658 + offsetX, 605.012 + offsetY);
  bezierVertex(375.658 + offsetX, 605.512 + offsetY, 370.658 + offsetX, 618.512 + offsetY, 378.158 + offsetX, 617.512 + offsetY);
  bezierVertex(385.658 + offsetX, 616.512 + offsetY, 398.158 + offsetX, 598.012 + offsetY, 412.658 + offsetX, 607.012 + offsetY);
  bezierVertex(427.158 + offsetX, 616.012 + offsetY, 372.658 + offsetX, 650.512 + offsetY, 376.158 + offsetX, 654.012 + offsetY);
  bezierVertex(379.658 + offsetX, 657.512 + offsetY, 391.158 + offsetX, 653.012 + offsetY, 398.158 + offsetX, 661.012 + offsetY);
  bezierVertex(405.158 + offsetX, 669.012 + offsetY, 361.658 + offsetX, 688.512 + offsetY, 363.658 + offsetX, 695.012 + offsetY);
  bezierVertex(365.658 + offsetX, 701.512 + offsetY, 385.158 + offsetX, 691.512 + offsetY, 386.658 + offsetX, 704.512 + offsetY);
  endShape(CLOSE);

  // Path 16
  stroke(#FFFFFF);
  strokeWeight(2);
  line(245.658 + offsetX, 640.953 + offsetY, 205.658 + offsetX, 598.512 + offsetY);
  line(245.658 + offsetX, 640.953 + offsetY, 238.658 + offsetX, 605.512 + offsetY);

  // Path 17
  beginShape();
  fill(#8CCB24);
  vertex(264.158 + offsetX, 677.512 + offsetY);
  bezierVertex(255.758 + offsetX, 690.712 + offsetY, 287.324 + offsetX, 713.679 + offsetY, 304.158 + offsetX, 723.512 + offsetY);
  bezierVertex(308.824 + offsetX, 699.845 + offsetY, 316.558 + offsetX, 651.612 + offsetY, 310.158 + offsetX, 648.012 + offsetY);
  bezierVertex(302.158 + offsetX, 643.512 + offsetY, 302.158 + offsetX, 657.012 + offsetY, 297.158 + offsetX, 654.512 + offsetY);
  bezierVertex(292.158 + offsetX, 652.012 + offsetY, 321.658 + offsetX, 589.012 + offsetY, 297.158 + offsetX, 574.012 + offsetY);
  bezierVertex(272.658 + offsetX, 559.012 + offsetY, 284.658 + offsetX, 610.012 + offsetY, 276.158 + offsetX, 614.012 + offsetY);
  bezierVertex(267.658 + offsetX, 618.012 + offsetY, 278.658 + offsetX, 600.512 + offsetY, 264.158 + offsetX, 605.512 + offsetY);
  bezierVertex(249.658 + offsetX, 610.512 + offsetY, 291.658 + offsetX, 671.012 + offsetY, 282.158 + offsetX, 680.012 + offsetY);
  bezierVertex(272.658 + offsetX, 689.012 + offsetY, 274.658 + offsetX, 661.012 + offsetY, 264.158 + offsetX, 677.512 + offsetY);
  endShape(CLOSE);

  // Path 18
  stroke(#FFFFFF);
  strokeWeight(2);
  line(357.158 + offsetX, 660.512 + offsetY, 392.158 + offsetX, 624.512 + offsetY);
  line(357.158 + offsetX, 660.512 + offsetY, 360.658 + offsetX, 637.512 + offsetY);

  // Path 19
  beginShape();
  fill(#57B70D);
  vertex(298.658 + offsetX, 689.511 + offsetY);
  bezierVertex(292.658 + offsetX, 695.111 + offsetY, 312.492 + offsetX, 714.178 + offsetY, 323.158 + offsetX, 723.011 + offsetY);
  bezierVertex(333.992 + offsetX, 710.511 + offsetY, 354.759 + offsetX, 685.112 + offsetY, 351.159 + offsetX, 683.512 + offsetY);
  bezierVertex(346.659 + offsetX, 681.512 + offsetY, 345.159 + offsetX, 687.512 + offsetY, 338.159 + offsetX, 689.511 + offsetY);
  bezierVertex(331.159 + offsetX, 691.51 + offsetY, 345.159 + offsetX, 641.012 + offsetY, 340.659 + offsetX, 641.012 + offsetY);
  bezierVertex(336.159 + offsetX, 641.012 + offsetY, 341.159 + offsetX, 649.012 + offsetY, 335.659 + offsetX, 648.512 + offsetY);
  bezierVertex(330.159 + offsetX, 648.012 + offsetY, 323.158 + offsetX, 613.512 + offsetY, 314.659 + offsetX, 617.012 + offsetY);
  bezierVertex(306.159 + offsetX, 620.512 + offsetY, 323.158 + offsetX, 663.011 + offsetY, 321.159 + offsetX, 665.011 + offsetY);
  bezierVertex(319.159 + offsetX, 667.011 + offsetY, 309.659 + offsetX, 652.011 + offsetY, 305.659 + offsetX, 655.011 + offsetY);
  bezierVertex(301.659 + offsetX, 658.011 + offsetY, 319.659 + offsetX, 691.511 + offsetY, 316.159 + offsetX, 694.511 + offsetY);
  bezierVertex(312.659 + offsetX, 697.511 + offsetY, 306.158 + offsetX, 682.511 + offsetY, 298.658 + offsetX, 689.511 + offsetY);
  endShape(CLOSE);

  // Path 20
  stroke(#FFFFFF);
  strokeWeight(2);
  line(324.658 + offsetX, 722.012 + offsetY, 324.658 + offsetX, 642.012 + offsetY);

  // Path 21
  stroke(#FFFFFF);
  strokeWeight(2);
  line(303.658 + offsetX, 723.012 + offsetY, 289.158 + offsetX, 602.512 + offsetY);
}

// Function to move a person towards a target location
void moveTowardsTarget(float[] pos, float[] target, float speed, int person) {
  float deltaX = target[0] - pos[0];
  float deltaY = target[1] - pos[1];
  float distance = dist(pos[0], pos[1], target[0], target[1]);

  if (distance > speed) {
    float angle = atan2(deltaY, deltaX);
    pos[0] += cos(angle) * speed;
    pos[1] += sin(angle) * speed;
  } else {
    pos[0] = target[0];
    pos[1] = target[1];
    if (person == 1) {
      walk_1 = false;
      reachedTarget1_2= true;
      //reachedTarget1 = true;
    } else if (person == 2) {
      walk_2 = false;
      reachedTarget2_2 = true;
      //reachedTarget2 = true;
    } else if (person == 3) {
      walk_3 = false;
    } else if (person == 4) {
      walk_4 = false;
    } else if (person == 5) {
      walk_5 = false;
    }
  }
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here)
  theta += 0.02;

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }

  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0) yvalues[i] += sin(x) * amplitude[j];
      else yvalues[i] += cos(x) * amplitude[j];
      x += dx[j];
    }
  }
}


int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int maxwaves = 4;   // Total number of waves to add together

float theta = 0.0;
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;

void renderWave(float tinggi, int r, int g, int b) {
  fill(r, g, b);

  noStroke();
  beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    vertex(x * xspacing, tinggi + yvalues[x]); // Position wave starting from y = 580
  }
  vertex(width, height); // Bottom right corner
  vertex(0, height); // Bottom left corner
  endShape(CLOSE);
}
float calcFishWave(float waveOffset) {
  float waveHeight = 0;
  for (int j = 0; j < maxwaves; j++) {
    if (j % 2 == 0) waveHeight += sin(theta + waveOffset) * amplitude[j];
    else waveHeight += cos(theta + waveOffset) * amplitude[j];
  }
  return waveHeight;
}
void drawFish(float offsetX, float offsetY, float scaleFactor) {
  fill(40, 45, 90);
  noStroke();
  beginShape();
  vertex((610.075 + offsetX) * scaleFactor, (101.488 + offsetY) * scaleFactor);
  bezierVertex((592.197 + offsetX) * scaleFactor, (90.649 + offsetY) * scaleFactor, (520.961 + offsetX) * scaleFactor, (156.924 + offsetY) * scaleFactor, (500.399 + offsetX) * scaleFactor, (184.638 + offsetY) * scaleFactor);
  bezierVertex((431.848 + offsetX) * scaleFactor, (143.058 + offsetY) * scaleFactor, (370.162 + offsetX) * scaleFactor, (115.345 + offsetY) * scaleFactor, (370.162 + offsetX) * scaleFactor, (115.345 + offsetY) * scaleFactor);
  bezierVertex((370.162 + offsetX) * scaleFactor, (115.345 + offsetY) * scaleFactor, (397.578 + offsetX) * scaleFactor, (-5.90428 + offsetY) * scaleFactor, (359.875 + offsetX) * scaleFactor, (1.01368 + offsetY) * scaleFactor);
  bezierVertex((325.532 + offsetX) * scaleFactor, (7.3316 + offsetY) * scaleFactor, (261.942 + offsetX) * scaleFactor, (52.602 + offsetY) * scaleFactor, (209.074 + offsetX) * scaleFactor, (94.5607 + offsetY) * scaleFactor);
  bezierVertex((119.961 + offsetX) * scaleFactor, (118.814 + offsetY) * scaleFactor, (12.1889 + offsetX) * scaleFactor, (180.527 + offsetY) * scaleFactor, (0 + offsetX) * scaleFactor, (240.063 + offsetY) * scaleFactor);
  bezierVertex((34.2701 + offsetX) * scaleFactor, (354.395 + offsetY) * scaleFactor, (229.637 + offsetX) * scaleFactor, (409.821 + offsetY) * scaleFactor, (346.166 + offsetX) * scaleFactor, (434.074 + offsetY) * scaleFactor);
  bezierVertex((403.526 + offsetX) * scaleFactor, (446.017 + offsetY) * scaleFactor, (370.162 + offsetX) * scaleFactor, (364.791 + offsetY) * scaleFactor, (370.162 + offsetX) * scaleFactor, (364.791 + offsetY) * scaleFactor);
  bezierVertex((370.162 + offsetX) * scaleFactor, (364.791 + offsetY) * scaleFactor, (431.848 + offsetX) * scaleFactor, (337.069 + offsetY) * scaleFactor, (500.399 + offsetX) * scaleFactor, (295.499 + offsetY) * scaleFactor);
  bezierVertex((520.962 + offsetX) * scaleFactor, (323.212 + offsetY) * scaleFactor, (592.197 + offsetX) * scaleFactor, (389.487 + offsetY) * scaleFactor, (610.075 + offsetX) * scaleFactor, (378.648 + offsetY) * scaleFactor);
  bezierVertex((627.215 + offsetX) * scaleFactor, (368.251 + offsetY) * scaleFactor, (582.658 + offsetX) * scaleFactor, (240.063 + offsetY) * scaleFactor, (582.658 + offsetX) * scaleFactor, (240.063 + offsetY) * scaleFactor);
  bezierVertex((582.658 + offsetX) * scaleFactor, (240.063 + offsetY) * scaleFactor, (627.215 + offsetX) * scaleFactor, (111.886 + offsetY) * scaleFactor, (610.075 + offsetX) * scaleFactor, (101.488 + offsetY) * scaleFactor);
  endShape();

  // Draw the circle
  fill(0);
  ellipse((121.949 + offsetX) * scaleFactor, (217.616 + offsetY) * scaleFactor, 56.154 * scaleFactor, 56.154 * scaleFactor);
}

void kantongSampah(float offsetX, float offsetY) {
  noFill();
  strokeWeight(1);

  // Path 1
  beginShape();
  fill(45);
  vertex(48 + offsetX, 21.3687 + offsetY);
  bezierVertex(38.4 + offsetX, 20.5687 + offsetY, 21.6667 + offsetX, 27.702 + offsetY, 14.5 + offsetX, 31.3687 + offsetY);
  bezierVertex(23.8333 + offsetX, 36.2022 + offsetY, 44.5 + offsetX, 45.5691 + offsetY, 52.5 + offsetX, 44.3691 + offsetY);
  bezierVertex(60.5 + offsetX, 43.1691 + offsetY, 78.5 + offsetX, 34.2025 + offsetY, 86.5 + offsetX, 29.8691 + offsetY);
  bezierVertex(77.6667 + offsetX, 27.369 + offsetY, 57.6 + offsetX, 22.1687 + offsetY, 48 + offsetX, 21.3687 + offsetY);
  endShape(CLOSE);

  // Path 2
  fill(198, 235, 228);
  beginShape();
  vertex(34.371 + offsetX, 5.23705 + offsetY);
  bezierVertex(34.7781 + offsetX, 2.61021 + offsetY, 38.3161 + offsetX, 1.47731 + offsetY, 40.9429 + offsetX, 1.88441 + offsetY);
  bezierVertex(43.5698 + offsetX, 2.29151 + offsetY, 47.327 + offsetX, 4.20638 + offsetY, 47.2059 + offsetX, 6.93064 + offsetY);
  vertex(47.1769 + offsetX, 7.22167 + offsetY);
  vertex(47.1 + offsetX, 7.61801 + offsetY);
  vertex(44.9882 + offsetX, 21.3152 + offsetY);
  vertex(48.5448 + offsetX, 30.3037 + offsetY);
  vertex(49.3446 + offsetX, 34.457 + offsetY);
  vertex(42.4259 + offsetX, 79.0999 + offsetY);
  vertex(37.979 + offsetX, 84.2237 + offsetY);
  vertex(19.8704 + offsetX, 81.4202 + offsetY);
  vertex(17.1494 + offsetX, 75.1374 + offsetY);
  vertex(24.0612 + offsetX, 30.5386 + offsetY);
  vertex(32.3355 + offsetX, 18.3713 + offsetY);
  endShape(CLOSE);

  // Outline of Path 2
  noFill();
  beginShape();
  vertex(34.371 + offsetX, 5.23705 + offsetY);
  bezierVertex(34.7781 + offsetX, 2.61021 + offsetY, 38.3161 + offsetX, 1.47731 + offsetY, 40.9429 + offsetX, 1.88441 + offsetY);
  bezierVertex(43.5698 + offsetX, 2.29151 + offsetY, 47.327 + offsetX, 4.20638 + offsetY, 47.2059 + offsetX, 6.93064 + offsetY);
  vertex(34.371 + offsetX, 5.23705 + offsetY);
  vertex(32.3355 + offsetX, 18.3713 + offsetY);
  bezierVertex(31.7734 + offsetX, 21.9982 + offsetY, 27.5914 + offsetX, 24.1471 + offsetY, 25.4026 + offsetX, 27.0932 + offsetY);
  vertex(24.0612 + offsetX, 30.5386 + offsetY);
  vertex(17.1494 + offsetX, 75.1374 + offsetY);
  bezierVertex(16.7688 + offsetX, 77.593 + offsetY, 17.7668 + offsetX, 80.0975 + offsetY, 19.8704 + offsetX, 81.4202 + offsetY);
  bezierVertex(25.8436 + offsetX, 85.1756 + offsetY, 30.6442 + offsetX, 86.1293 + offsetY, 37.979 + offsetX, 84.2237 + offsetY);
  bezierVertex(40.3651 + offsetX, 83.6037 + offsetY, 42.0484 + offsetX, 81.5361 + offsetY, 42.4259 + offsetX, 79.0999 + offsetY);
  bezierVertex(44.7897 + offsetX, 63.8474 + offsetY, 48.7112 + offsetX, 38.5441 + offsetY, 49.3446 + offsetX, 34.457 + offsetY);
  bezierVertex(49.6025 + offsetX, 32.7931 + offsetY, 49.225 + offsetX, 31.4135 + offsetY, 48.5448 + offsetX, 30.3037 + offsetY);
  vertex(44.9882 + offsetX, 21.3152 + offsetY);
  vertex(47.2059 + offsetX, 6.93064 + offsetY);
  endShape();

  // Path 3
  fill(198, 235, 228);
  beginShape();
  vertex(40.3782 + offsetX, 16.3089 + offsetY);
  bezierVertex(40.2042 + offsetX, 13.8195 + offsetY, 43.2072 + offsetX, 12.0461 + offsetY, 45.6966 + offsetX, 11.8721 + offsetY);
  bezierVertex(48.186 + offsetX, 11.698 + offsetY, 52.0239 + offsetX, 12.669 + offsetY, 52.4801 + offsetX, 15.1881 + offsetY);
  vertex(52.514 + offsetX, 15.4605 + offsetY);
  vertex(52.5261 + offsetX, 15.8393 + offsetY);
  vertex(53.4191 + offsetX, 28.4711 + offsetY);
  vertex(58.8052 + offsetX, 36.5611 + offsetY);
  vertex(60.1666 + offsetX, 39.9412 + offsetY);
  vertex(63.1067 + offsetX, 82.0001 + offsetY);
  vertex(59.9004 + offsetX, 87.9767 + offsetY);
  vertex(43.1937 + offsetX, 89.148 + offsetY);
  vertex(39.1434 + offsetX, 83.6343 + offsetY);
  vertex(36.2061 + offsetX, 41.6162 + offsetY);
  vertex(36.5655 + offsetX, 38.5609 + offsetY);
  vertex(41.22 + offsetX, 28.35 + offsetY);
  endShape(CLOSE);


  // Rectangles
  fill(150, 68, 231);
  rect(32.8877 + offsetX, 22.7744 + offsetY, 41.1782, 20.8791, 6.68833);

  // Path 4
  fill(45);
  beginShape();
  vertex(46.62 + offsetX, 163.869 + offsetY);
  vertex(8.62 + offsetX, 145.369 + offsetY);
  vertex(0.12 + offsetX, 123.369 + offsetY);
  vertex(2.62517 + offsetX, 80.746 + offsetY);
  vertex(8.62518 + offsetX, 42.246 + offsetY);
  vertex(14.0002 + offsetX, 31.3693 + offsetY);
  vertex(33.5691 + offsetX, 34.0139 + offsetY);
  bezierVertex(41.5691 + offsetX, 37.0139 + offsetY, 56.513 + offsetX, 36.2819 + offsetY, 66.5691 + offsetX, 34.0139 + offsetY);
  bezierVertex(77.7873 + offsetX, 31.4837 + offsetY, 84.5 + offsetX, 27.3691 + offsetY, 90.5 + offsetX, 31.3691 + offsetY);
  bezierVertex(96.5 + offsetX, 35.3691 + offsetY, 98 + offsetX, 47.8691 + offsetY, 105.625 + offsetX, 78.2462 + offsetY);
  bezierVertex(108.625 + offsetX, 82.7462 + offsetY, 111.62 + offsetX, 120.369 + offsetY, 112.62 + offsetX, 123.369 + offsetY);
  bezierVertex(113.62 + offsetX, 126.369 + offsetY, 108.12 + offsetX, 146.869 + offsetY, 94.12 + offsetX, 146.869 + offsetY);
  bezierVertex(88.62 + offsetX, 148.369 + offsetY, 85.62 + offsetX, 155.369 + offsetY, 81.62 + offsetX, 155.369 + offsetY);
  vertex(68.62 + offsetX, 155.369 + offsetY);
  vertex(46.62 + offsetX, 163.869 + offsetY);
  endShape(CLOSE);
}
