Spaceship ship;
Star[] stars;

void setup() {
  size(800, 600);
  ship = new Spaceship();

  stars = new Star[150];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);

  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }

  ship.move();
  ship.show();
}

public void keyPressed() {
  if (keyCode == LEFT) {
    ship.turn(-5);
  } else if (keyCode == RIGHT) {
    ship.turn(5);
  } else if (keyCode == UP) {
    ship.accelerate(0.2);
  } else if (key == 'h' || key == 'H') {
    ship.hyperspace();
  }
}
