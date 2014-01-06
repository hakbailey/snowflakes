/**
 * GlitterFlake
 * 
 * A simple particle flake drawn as a white, rotating planar hexagon
 * @author: Helen Bailey (@helenkbailey)
 *
 */
class GlitterFlake extends Flake {
  float a;
  float b;
  float r;
  float test;

  GlitterFlake(color flakeColor, float xFlake, float yFlake, float zFlake, int flakeRadius) {
    super(flakeColor, xFlake, yFlake, zFlake, flakeRadius);  
    a = random(8.0);
    b = a;
  }

  void display() { 
    noStroke();
    test = random(1);
    if (test >= 0.5) {
      fill(255, 255, 255, 200);
    } else {
      fill(255, 255, 255, 100);
    }

    pushMatrix();
      translate(location.x, location.y, location.z);
      rotateX(spin + random(-0.1, 0.1));
      rotateY(spin + random(-0.1, 0.1));
      rotateZ(spin + random(-0.1, 0.1));
      hexagon(radius, 0, 0);
    popMatrix();
  }
  
  void hexagon(float hexRadius, float xHex, float yHex) {
    beginShape();
     for (int k = 0; k < 6; k++) {
       vertex(xHex + hexRadius * cos(theta * k), yHex + hexRadius * sin(theta * k));
     }
    endShape(CLOSE);
  }
}

