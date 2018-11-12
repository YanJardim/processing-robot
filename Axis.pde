class Axis extends GameObject {
  public Axis(PVector pos, PVector scale) {
    super(pos, 0, scale);
    setColor(color(0, 0, 255));
  }
  
  @Override
  public void update(){
     super.update();

  }
  @Override
  public void drawShape() {
    fill(c);
    //stroke(0, 255, 0);
    ellipse(0, 0, scale.x, scale.y);
  }
  
}
