class Bullet extends Floater {

  int spawnTime;

  Bullet(Spaceship theShip) {
    corners = 0;
    xCorners = new int[0];
    yCorners = new int[0];

    myColor = color(255, 255, 0);

    myCenterX = theShip.getX();
    myCenterY = theShip.getY();

    myXspeed = theShip.getXSpeed();
    myYspeed = theShip.getYSpeed();

    myPointDirection = theShip.getDirection();

    accelerate(6.0);

    spawnTime = millis();
  }

  void show() {
    fill(myColor);
    noStroke();
    ellipse((float)myCenterX, (float)myCenterY, 8, 8);
  }

  float getX() {
    return (float)myCenterX;
  }

  float getY() {
    return (float)myCenterY;
  }

  boolean isExpired() {
    return millis() - spawnTime > 5000;
  }
}
