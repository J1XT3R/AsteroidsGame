public class Bullet extends Floater {
  
  int spawnTime;

  public Bullet(Spaceship theShip) {
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

  @Override
  public void show() {
    fill(myColor);
    noStroke();
    ellipse((float)myCenterX, (float)myCenterY, 8, 8);
  }
  
  public float getX() { return (float)myCenterX; }
  public float getY() { return (float)myCenterY; }
  
   public boolean isExpired() { return millis() - spawnTime > 5000; }
}
