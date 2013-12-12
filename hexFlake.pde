class HexFlake {
  color c;
  float xCenter, yCenter;
  int radius;
  float xDelta, yDelta;
  float spin, spinRate;
  int numHexSets;
  int[][] hexSetValues;
  ArrayList hexSetCoords;
  
  HexFlake(color flakeColor, float xFlake, float yFlake, int flakeRadius) {
    c = color(flakeColor);
    xCenter = xFlake;
    yCenter = yFlake;
    radius = flakeRadius;
    xDelta = random(-1, 1);
    yDelta = random(1, 3);
    spin = 0;
    spinRate = 0;
    hexSetCoords = new ArrayList();

    numHexSets = int(random(5, 9));
    hexSetValues = new int[numHexSets][2];
    
    for (int i = 0; i < numHexSets; i++) {
      hexSetValues[i][0] = int(random(minHexRadius, maxHexRadius));
      hexSetValues[i][1] = int(random(radius));
    }
    
    for (int j = 0; j < numHexSets; j++) {
      addHexSet(hexSetValues[j][0], hexSetValues[j][1]);
    }
    
    while (abs(spinRate) < 0.005) {
      spinRate=random(-0.015, 0.015);
    }
  }
  
  void display() {
    fill(c);
    noStroke();
    pushMatrix();
    translate(xCenter, yCenter);
    rotate(spin);
    hexagon(radius, 0, 0);

    for (int i = 0; i < hexSetCoords.size(); i++) {
      float[][] tempCoords = (float[][])hexSetCoords.get(i);
      for (int j = 1; j < tempCoords.length; j++) {
        float tempx = tempCoords[j][0];
        float tempy = tempCoords[j][1];
        int tempRadius = int(tempCoords[0][0]);
        hexagon(tempRadius, tempx, tempy);
      }
    }
    popMatrix();
  }

  void hexagon(int hexRadius, float xHex, float yHex) {
    beginShape();
     for (int k = 0; k < 6; k++) {
       vertex(xHex + hexRadius * cos(theta * k), yHex + hexRadius * sin(theta * k));
     }
    endShape(CLOSE);
  }
  
  void addHexSet(int hexRadius, int setRadius) {
    float[][] coords = {  {hexRadius, 0},
                          {setRadius, 0},
                          {setRadius * cos(theta), setRadius * sin(theta)},
                          {-setRadius * cos(theta), setRadius * sin(theta)},
                          {-setRadius, 0},
                          {-setRadius * cos(theta), -setRadius * sin(theta)},
                          {setRadius * cos(theta), -setRadius * sin(theta)}  };
    hexSetCoords.add(coords);
  }
      
  void fall() {
    spin += spinRate;
    xCenter += xDelta;
    yCenter += yDelta;
  }
  
  public float getY() {
    return yCenter;
  }
}