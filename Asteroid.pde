public class Asteroid extends Floater {

  private double rotationSpeed;

  public Asteroid() {

    corners = 8;
    xCorners = new int[] { -20, -10, 5, 15, 20, 10, -5, -15 };
    yCorners = new int[] { -10, -20, -20, -10, 5, 15, 20, 10 };

    myColor = color(150);

    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;

    myXspeed = Math.random() * 4 - 2;
    myYspeed = Math.random() * 4 - 2;

    myPointDirection = Math.random() * 360;

    rotationSpeed = Math.random() * 4 - 2;
  }

  public float getX() { return (float)myCenterX; }
  public float getY() { return (float)myCenterY; }

  @Override
  public void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    myPointDirection += rotationSpeed;

    if (myCenterX > width)  myCenterX = 0;
    if (myCenterX < 0)      myCenterX = width;
    if (myCenterY > height) myCenterY = 0;
    if (myCenterY < 0)      myCenterY = height;
  }
}
