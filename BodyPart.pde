class BodyPart extends GameObject {
  private boolean selected;
  public BodyPart(PVector pos, PVector scale, boolean selected, String imageName) {
    super(pos, 0, scale);
    this.selected = selected;
    load(imageName);
  }

  @Override
    public void update() {
    super.update();
    if (!selected) {
      c = color(255);
      return;
    }
    c = color(255, 0, 0);
    getInput();
  }

  @Override
    public void draw() {
    super.draw();
    drawWithRotation();
  }

  public void drawWithRotation() {

    pushMatrix();
    translate(position.x, position.y);
    rotate(rotAngle);
    pushMatrix();
    translate(-pivot.x, -pivot.y);
    drawBoudingBox();
    drawShape();
    for (GameObject child : childrens) {
      pushMatrix();
      translate(child.getPosition().x, child.getPosition().y);
      child.draw();
      popMatrix();
    }
    popMatrix();
    drawAxis(20);
    popMatrix();
  }
  @Override
    public void drawShape() {
    drawImage(0, 0);
  }

  public void getInput() {
    if (keyPressed) {
      if (key == 'a') {
        rotAngle -= time.deltatime() * rotSpeed;
      }
      if (key == 'd') {
        rotAngle += time.deltatime() * rotSpeed;
      }
    }
  }

  void rotate2D(PVector p, float theta, PVector center)
  {
    position.x = cos(theta) * (p.x-center.x) - sin(theta) * (p.y-center.y) + center.x;
    position.y = sin(theta) * (p.x-center.x) + cos(theta) * (p.y-center.y) + center.y  ;
  }

  public void setSelected(boolean value) {
    this.selected = value;
  }
  public boolean isSelected() {
    return selected;
  }
}
