class LineFlake {
  color c;
  float xCenter, yCenter;
  int radius;
  float xDelta, yDelta;
  float spin, spinRate;
  ArrayList stemValues;
  
  LineFlake(color flakeColor, float xFlake, float yFlake, int flakeRadius) {
    c = color(flakeColor);
    xCenter = xFlake;
    yCenter = yFlake;
    radius = flakeRadius;
    xDelta = random(-1, 1);
    yDelta = random(1, 3);
    spin = 0;
    spinRate = 0;
    stemValues = new ArrayList();
  
    calculateStemValues();
    
    while (abs(spinRate) < 0.005) {
      spinRate=random(-0.015, 0.015);
    }
  }
  
  void display() {
    strokeWeight(8);
    stroke(c);
    pushMatrix();
    translate(xCenter, yCenter);
    rotate(spin);
    
    hexSkeleton(radius);
    rotate(radians(30));
    for (int i = 0; i < 6; i++) {
      drawStem();
    }
    popMatrix();
  }

  void hexSkeleton(int r) {
    line(-r, 0, r, 0);
    line(r * cos(theta), -r * sin(theta), -r * cos(theta), r * sin(theta));
    line(r * cos(theta), r * sin(theta), -r * cos(theta), -r * sin(theta));
  }

  void calculateStemValues() {
    for (int i = 0; i <= radius; i += 6) {
      if (random(10) < 5) {
        float endpoint = random(5, radius/2);
        float stemTheta = radians(random(30, 60));
        float[] tempValues = { float(i), endpoint, stemTheta };
        stemValues.add(tempValues);
      }
    }
  }

  void drawStem() {
    rotate(theta);
    for (int i = 0; i < stemValues.size(); i++) {
      float[] tempValues = (float[])stemValues.get(i);
      pushMatrix();
      translate(0, tempValues[0]);
      rotate(tempValues[2]);
      line(0, 0, 0, tempValues[1]);
      popMatrix();
      
      pushMatrix();
      translate(0, tempValues[0]);
      rotate(-tempValues[2]);
      line(0, 0, 0, tempValues[1]);
      popMatrix();
    }
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
