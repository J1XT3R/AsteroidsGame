class Spaceship extends Floater {

  Spaceship() {
    corners = 3;
    xCorners = new int[] { -10, 15, -10 };
    yCorners = new int[] { -10, 0, 10 };

    myColor = color(255);

    myCenterX = width / 2.0;
    myCenterY = height / 2.0;

    myXspeed = 0;
    myYspeed = 0;

    myPointDirection = 0; // facing right
  }

  void hyperspace() {
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;

    myXspeed = 0;
    myYspeed = 0;

    myPointDirection = Math.random() * 360;
  }

  float getX() {
    return (float)myCenterX;
  }

  float getY() {
    return (float)myCenterY;
  }

  double getXSpeed() {
    return myXspeed;
  }

  double getYSpeed() {
    return myYspeed;
  }

  double getDirection() {
    return myPointDirection;
  }
}
