abstract class Flake {
  color c;
  int radius;
  float xDelta, yDelta;
  float spin, spinRate;
  boolean sparkle = false; 
  
  PVector location;
  PVector velocity;
  PVector acceleration; 
  
  /**
   * @param x - Initial x position
   * @param y - Initial y position
   * @param r - Radius of flake
   */
  Flake(color flakeColor, float x, float y, float z, int r) {
    location = new PVector(x, y, z);
    velocity = new PVector(0, 2, 0);
    acceleration = new PVector(0, 0, 0);
    
    c = color(flakeColor);
    radius = r;
    xDelta = random(-1, 1);
    yDelta = random(1, 3);
    spin = 0;
    spinRate = 0;
    
    while(abs(spinRate) < 0.005) {
      spinRate = random(-0.015, 0.015);
    }
  }
  
  // TODO: Find out why the Leap convertVectorToPVector method is missing from the LeapP5 object
  // In the meantime, a separate apply method that translates the Leap motion parameters to PVector forces
  public void applyInteractionForce(Vector v) {
    
    // The magnitude of the vector from Leap is always 1.0.
    // Randomize the magnitude for each flake.
    float forceVariance = random(0.5, 2.0);
    PVector force;
    
    if(zScatter) {
      force = new PVector(v.getX(), 0f, random(-3, 3));
    } else {
      force = new PVector(v.getX(), 0f, 0f);
    }
    
    force.setMag(forceVariance);
    applyForce(force);
    
    // Spin faster upon interaction; kind of a punt.
    spinRate *= 1.2;
  }
  
  public void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    spin += spinRate;
  }
  
  public void display() {
    // no-op.  overridden in sub-classes.
  }
}
