class HexFlake extends Flake {
  int numHexSets;
  int[][] hexSetValues;
  ArrayList hexSetCoords;
  
  HexFlake(color flakeColor, float xFlake, float yFlake, int flakeRadius) {
    super(flakeColor, xFlake, yFlake, flakeRadius);
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
  }
  
  void display() {
//    fill(c)
//    fill(red(c) + random(-10, 10), green(c) + random(-10, 10), blue(c) + random(-10, 10), 40);
    fill(red(c), green(c), blue(c), random(35, 45));
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
      
}
