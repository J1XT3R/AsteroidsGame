class Star {
  int myX;
  int myY;
  int myBrightness;

  Star() {
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);
    myBrightness = 150 + (int)(Math.random() * 106);
  }

  void show() {
    stroke(myBrightness);
    point(myX, myY);
  }
}
