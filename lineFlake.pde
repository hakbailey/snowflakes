class LineFlake extends Flake{
  ArrayList stemValues;
  
  LineFlake(color flakeColor, float xFlake, float yFlake, float zFlake, int flakeRadius) {
    super(flakeColor, xFlake, yFlake, zFlake, flakeRadius);
    stemValues = new ArrayList();  
    calculateStemValues();    
  }
  
  void display() {
    strokeWeight(8);
    stroke(red(c), green(c), blue(c), random(alpha(c), alpha(c) + 20));
    pushMatrix();
    translate(location.x, location.y, location.z);
    
    // Spin 2D, and conditionally 3D
    if(rotateFlakes) {
      rotateY(spin/4);
    }
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
  
  void drawToBuffer(PGraphics buffer) {
    buffer.strokeWeight(8);
    buffer.stroke(red(c), green(c), blue(c), alpha(c) + 10);
    translate(width/2, height/2, location.z);
    
    hexSkeletonBuffer(radius, buffer);
    buffer.rotate(radians(30));
    for (int i = 0; i < 6; i++) {
      drawStemBuffer(buffer);
    }
  }

  void hexSkeletonBuffer(int r, PGraphics buffer) {
    buffer.line(-r, 0, r, 0);
    buffer.line(r * cos(theta), -r * sin(theta), -r * cos(theta), r * sin(theta));
    buffer.line(r * cos(theta), r * sin(theta), -r * cos(theta), -r * sin(theta));
  }
  
  void drawStemBuffer(PGraphics buffer) {
    buffer.rotate(theta);
    for (int i = 0; i < stemValues.size(); i++) {
      float[] tempValues = (float[])stemValues.get(i);
      buffer.pushMatrix();
      buffer.translate(0, tempValues[0]);
      buffer.rotate(tempValues[2]);
      buffer.line(0, 0, 0, tempValues[1]);
      buffer.popMatrix();
      
      buffer.pushMatrix();
      buffer.translate(0, tempValues[0]);
      buffer.rotate(-tempValues[2]);
      buffer.line(0, 0, 0, tempValues[1]);
      buffer.popMatrix();
    }
  }
}
