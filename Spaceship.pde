public class Spaceship extends Floater {

  public Spaceship() {
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

  public void hyperspace() {
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;

    myXspeed = 0;
    myYspeed = 0;

    myPointDirection = Math.random() * 360;
  }

  public float getX() { return (float)myCenterX; }
  public float getY() { return (float)myCenterY; }
  public double getXSpeed() { return myXspeed;   }
  public double getYSpeed() { return myYspeed;   }
  public double getDirection() { return myPointDirection; }
}
