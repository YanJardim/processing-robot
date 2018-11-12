class BodyPart extends GameObject {
  private boolean selected;
  public BodyPart(PVector pos, PVector scale, boolean selected) {
    super(pos, 0, scale);
    this.selected = selected;
  }

  @Override
    public void update() {
    super.update();
    if (!selected) return;
    getInput();
    if (parent != null) {
      //rotate2D(parent.getPosition(), rotAngle, position);
    }
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
