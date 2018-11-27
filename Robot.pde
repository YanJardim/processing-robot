Time time;

BodyPart arm, forearm, hand, selected;
GameManager manager;
ButtonSpawner buttonSpawner;
PImage bgImage;

final int axisSize = 50;
final int axisHalf = axisSize / 2;


public enum Pivots {
  MIDDLE, MIDDLELEFT, MIDDLERIGHT, TOPLEFT, TOPRIGHT, BOTTOMLEFT, BOTTOMRIGHT
}

void setup() {
  size(800, 800);
  time = new Time();
  manager = new GameManager(60);
  buttonSpawner = new ButtonSpawner(2, new PVector(300, 300));
  arm = new BodyPart(new PVector(0, 0), new PVector(140, 30), true, getImageArmsPath("Braço2-3"));
  forearm = new BodyPart(new PVector(arm.getScale().x / 2, arm.getScale().y / 4), new PVector(140, 28), false, getImageArmsPath("Braço2-1"));
  hand = new BodyPart(new PVector(forearm.getScale().x / 2, forearm.getScale().y / 4), new PVector(70, 50), false, getImageArmsPath("Mão2"));

  arm.setPivot(Pivots.MIDDLELEFT);
  forearm.setPivot(Pivots.MIDDLELEFT);
  hand.setPivot(Pivots.MIDDLELEFT);

  arm.addChildren(forearm);
  forearm.addChildren(hand);
  selected = arm;

  bgImage = loadImage(getImageScenePath("mesa"));
}

void draw() {
  translate(width / 2, height / 2);
  background(0);
  //image(bgImage, -width / 2, -height / 2, width + 100, height + 100);
  time.setDeltaTime();

  //Updates
  manager.update();
  if (manager.compareState(State.GAME)) {

    hand.updateBoudingBox(hand.getGlobalPosition());
    checkCollisions();
    buttonSpawner.update();

    //Draws

    hand.drawBoudingBox();
    arm.draw();
    buttonSpawner.draw();
  }

  manager.draw();

  time.setLastTime();
}

String getImagePath(String file) {
  return "images/" + file + ".png";
}

String getImageArmsPath(String file) {
  return getImagePath("arm/" + file);
}

String getImageScenePath(String file) {
  return getImagePath("scene/" + file);
}



void keyPressed() {
  if (key == '1') {
    selectPart(arm);
  }
  if (key == '2') {
    selectPart(forearm);
  }
  if (key == '3') {
    selectPart(hand);
  }
}

void checkCollisions() {
  ArrayList<Button> buttons = buttonSpawner.getButtons();
  int i = 0;
  for (Button b : buttons) {
    if (hand.checkCollision(b) && !b.isDead() ) {
      manager.addPoints(b.getPoints());
      b.die();
      //println("Colidiu com: " + i);
    }
    i++;
  }
}

void selectPart(BodyPart obj) {
  obj.setSelected(true);
  selected.setSelected(false);
  selected = obj;
}
