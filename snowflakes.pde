float theta = radians(60);
float minHexRadius = 10;
float maxHexRadius = 50;
float minFlakeRadius = 50;
float maxFlakeRadius = 200;
int numFlakes = 20;
color flakeColor;
ArrayList snowflakes;

void setup() {
  size(displayWidth, displayHeight, P2D);
  smooth();
  snowflakes = new ArrayList();
  for (int i = 0; i < numFlakes; i++) {
    if (random(10) < 5) {
      flakeColor = color(int(random(40, 60)), int(random(60, 200)), int(random(210, 230)), 40);
      snowflakes.add(new HexFlake(flakeColor, random(width), random(-height, height), int(random(minFlakeRadius, maxFlakeRadius))));
    }
    else {
      flakeColor = color(int(random(40, 60)), int(random(60, 200)), int(random(210, 230)), 60);
      snowflakes.add(new LineFlake(flakeColor, random(width), random(-height, height), int(random(minFlakeRadius, maxFlakeRadius))));    
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < snowflakes.size(); i++) {
    Object tempObj = snowflakes.get(i);
    if (tempObj instanceof HexFlake) {
      HexFlake tempflake = (HexFlake)snowflakes.get(i);
      tempflake.fall();
      tempflake.display();
    }
    else if (tempObj instanceof LineFlake) {
      LineFlake tempflake = (LineFlake)snowflakes.get(i);
      tempflake.fall();
      tempflake.display();      
    }
  updateSnowflakes();
  println(frameRate);
  }
}

void updateSnowflakes() {
  for (int i = 0; i < snowflakes.size(); i++) {
    Object tempFlake = snowflakes.get(i);
    if (tempFlake instanceof HexFlake) {
      HexFlake tHexFlake = (HexFlake)snowflakes.get(i);
      if (tHexFlake.getY() > height + maxFlakeRadius + maxHexRadius) {
        snowflakes.remove(i);
        snowflakes.add(new HexFlake(flakeColor, random(width), random(2 * -maxFlakeRadius, -maxFlakeRadius), int(random(minFlakeRadius, maxFlakeRadius))));
      }
    }
    else if (tempFlake instanceof LineFlake) {
      LineFlake tLineFlake = (LineFlake)snowflakes.get(i);      
      if (tLineFlake.getY() > height + maxFlakeRadius + maxHexRadius) {
        snowflakes.remove(i);
        snowflakes.add(new LineFlake(flakeColor, random(width), random(2 * -maxFlakeRadius, -maxFlakeRadius), int(random(minFlakeRadius, maxFlakeRadius))));
      }
    }
  }
}

