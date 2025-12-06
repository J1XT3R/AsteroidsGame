Spaceship ship;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>(); 
Star[] stars;

boolean shooting = false;
int shootCooldown = 0; 

boolean turningLeft = false;
boolean turningRight = false;
boolean thrusting = false;

boolean shipAlive = true;
boolean shipExploding = false;
int shipRespawnTime = 0;
float explosionX, explosionY;

int baseAsteroidSpawnDelay = 2000;
int asteroidSpawnDelay = 2000;
int minAsteroidSpawnDelay = 400;
int nextAsteroidTime = 0;

int score = 0;

void setup() {
  size(800, 600);

  ship = new Spaceship();

  stars = new Star[150];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
}

void draw() {
  background(0);
  
  fill(255);
  textAlign(RIGHT, TOP);
  textSize(20);
  text("Score: " + score, width - 10, 10);
  
  if (millis() >= nextAsteroidTime) {
    asteroids.add(new Asteroid());
    nextAsteroidTime = millis() + asteroidSpawnDelay;
  }

  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  
  if (shipAlive) {
    if (turningLeft)  ship.turn(-5);
    if (turningRight) ship.turn(5);
    if (thrusting)    ship.accelerate(0.2);

    ship.move();
    ship.show();
  } else {
    if (shipExploding) {
      noStroke();
      fill(255, 150, 0);
      ellipse(explosionX, explosionY, 50, 50);
      fill(255, 255, 0);
      ellipse(explosionX, explosionY, 25, 25);
  }

  if (millis() >= shipRespawnTime) {
      ship = new Spaceship();
      shipAlive = true;
      shipExploding = false;
      turningLeft = turningRight = false;
      thrusting = false;
    }
  }
  
  if (shipAlive && shooting) {
    if (shootCooldown <= 0) {
      bullets.add(new Bullet(ship));
      shootCooldown = 10;
    }
  }
  
  if (shootCooldown > 0) {
    shootCooldown--;
  }

  ship.move();
  ship.show();
  
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    
    if (b.isExpired()) {
      bullets.remove(i);
      continue;
    }

    b.move();
    b.show();
  }

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    
    boolean asteroidDestroyed = false;
    for (int j = bullets.size() - 1; j >= 0; j--) {
      Bullet b = bullets.get(j);
  
      float d = dist(a.getX(), a.getY(), b.getX(), b.getY());
  
      if (d < 20) {
        bullets.remove(j);
        asteroids.remove(i);
        asteroidDestroyed = true;
        
        score += 10;
        
        asteroidSpawnDelay = baseAsteroidSpawnDelay - score * 20;
        if (asteroidSpawnDelay < minAsteroidSpawnDelay) {
          asteroidSpawnDelay = minAsteroidSpawnDelay;
        }
        
        break;
      }
    }
    
    if (asteroidDestroyed) {
      continue;
    }

    if (shipAlive) {
      float d = dist(a.getX(), a.getY(), ship.getX(), ship.getY());
      if (d < 20) {
        shipAlive = false;
        shipExploding = true;
        explosionX = ship.getX();
        explosionY = ship.getY();
        shipRespawnTime = millis() + 2000;
      }
    }

    a.move();
    a.show();
  }
  
}
void keyPressed() {
  if (!shipAlive) return; 
  
  if (keyCode == LEFT) {
    turningLeft = true;
  } else if (keyCode == RIGHT) {
    turningRight = true;
  } else if (keyCode == UP) {
    thrusting = true;
  } 
  
  else if (key == 'a' || key == 'A') {
    turningLeft = true;
  } else if (key == 'd' || key == 'D') {
    turningRight = true;
  } else if (key == 'w' || key == 'W') {
    thrusting = true;
  }
  
  else if (key == 'h' || key == 'H') {
    ship.hyperspace();
  } else if (key == ' ') {
    shooting = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    shooting = false;
  }
  
  else if (keyCode == LEFT) {
    turningLeft = false;
  } else if (keyCode == RIGHT) {
    turningRight = false;
  } else if (keyCode == UP) {
    thrusting = false;
  } 
  
  else if (key == 'a' || key == 'A') {
    turningLeft = false;
  } else if (key == 'd' || key == 'D') {
    turningRight = false;
  } else if (key == 'w' || key == 'W') {
    thrusting = false;
  }
}
