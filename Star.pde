public class Star {
  private int myX;
  private int myY;
  private int myBrightness;

  public Star() {
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);
    myBrightness = 150 + (int)(Math.random() * 106);
  }

  public void show() {
    stroke(myBrightness);
    point(myX, myY);
  }
}
