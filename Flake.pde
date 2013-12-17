class Flake {
  color c;
  float xCenter, yCenter;
  int radius;
  float xDelta, yDelta;
  float spin, spinRate;
  boolean sparkle = false; 
  
  Flake(color flakeColor, float xFlake, float yFlake, int flakeRadius) {
    c = color(flakeColor);
    xCenter = xFlake;
    yCenter = yFlake;
    radius = flakeRadius;
    xDelta = random(-1, 1);
    yDelta = random(1, 3);
    spin = 0;
    spinRate = 0;
    
    while (abs(spinRate) < 0.005) {
      spinRate=random(-0.015, 0.015);
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
