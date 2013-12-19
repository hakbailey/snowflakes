/**
 * PrismFlake
 * 
 * A simple particle flake drawn as a white, rotating double hexagonal pyramid.
 * @author: Helen Bailey (helenkbailey)
 *
 */
class PrismFlake extends Flake {
  float[][] vVals;
  
  PrismFlake(color flakeColor, float xFlake, float yFlake, float zFlake, int flakeRadius) {
    super(flakeColor, xFlake, yFlake, zFlake, flakeRadius);
    vVals = new float[6][2];
  } 

  void display() {
    pushMatrix();
      translate(location.x, location.y, location.z);
      
      // Spin 2D, and conditionally 3D
      if(rotateFlakes) {
        rotateY(spin/4);
      }
      rotate(spin);
      
      // Draw hexagonal pyramid base (no fill, otherwise the transparency looks weird)     
      noFill();
      strokeWeight(4);
      stroke(255, 255, 255, 5);
      base(radius, 0, 0);
      
      // Add six pyramid faces on either side of the base hexagon
      fill(255, 255, 255, random(alpha(c), alpha(c) + 10));
      addFaces();
    popMatrix();
  }
  
  void base(int hexRadius, float xHex, float yHex) {
    beginShape();
     for (int i = 0; i < 6; i++) {
       float vx = xHex + hexRadius * cos(theta * i);
       float vy = yHex + hexRadius * sin(theta * i);
       vVals[i][0] = vx;
       vVals[i][1] = vy;
       vertex(vx, vy);
     }
    endShape(CLOSE);
  }
  
  void face(float vxa, float vya, float vza, float vxb, float vyb, float vzb, float vxc, float vyc, float vzc) {
    beginShape();
    vertex(vxa, vya, vza);
    vertex(vxb, vyb, vzb);
    vertex(vxc, vyc, vzc);
    endShape(CLOSE);
  }
  
  void addFaces() {
    for (int i = 0; i < 5; i++) {
      face(vVals[i][0], vVals[i][1], 0, vVals[i + 1][0], vVals[i + 1][1], 0, 0, 0, radius);
      face(vVals[i][0], vVals[i][1], 0, vVals[i + 1][0], vVals[i + 1][1], 0, 0, 0, -radius);
    }
    face(vVals[5][0], vVals[5][1], 0, vVals[0][0], vVals[0][1], 0, 0, 0, radius);
    face(vVals[5][0], vVals[5][1], 0, vVals[0][0], vVals[0][1], 0, 0, 0, -radius);
  }
}
