/**
 * CubeFlake
 * 
 * A simple particle flake drawn as a white, rotating cube
 * @author: Sands Fish (@sandsfish)
 *
 */
class CubeFlake extends Flake {

  CubeFlake(color flakeColor, float xFlake, float yFlake, float zFlake, int flakeRadius) {
    super(flakeColor, xFlake, yFlake, zFlake, flakeRadius);
  } 

  void display() {
    fill(255, 255, 255, alpha(c));
    noStroke();
    pushMatrix();
      translate(location.x, location.y, location.z);
      rotateX(spin + random(-0.1, 0.1));
      rotateY(spin + random(-0.1, 0.1));
      box(radius);
    popMatrix();
  }
}

