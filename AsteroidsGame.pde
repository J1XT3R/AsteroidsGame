Spaceship ship;
ArrayList<Asteroid> asteroids;
Star[] stars;

void setup() {
  size(800, 600);

  ship = new Spaceship();

  stars = new Star[150];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
}

void draw() {
  background(0);

  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }

  ship.move();
  ship.show();

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);

    float d = dist(a.getX(), a.getY(), ship.getX(), ship.getY());

    if (d < 20) {
      asteroids.remove(i);
    } else {
      a.move();
      a.show();
    }
  }
}

void keyPressed() {
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
