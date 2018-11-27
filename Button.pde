class Button extends GameObject {
  public Button(PVector pos, PVector scale, String imageName) {
    super(pos, 0, scale);
    setColor(color(0, 0, 255));
    load(imageName);
  }

  @Override
    public void update() {
    super.update();
  }

  @Override
    public void draw() {
    super.draw();
    drawImage(position.x, position.y);
  }



  @Override
    public void drawShape() {
    fill(c);
    //stroke(0, 255, 0);
    ellipse(0, 0, scale.x, scale.y);
  }
}
