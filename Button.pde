class Button extends GameObject {
  private float lifeTimer, lifeTime;
  public Button(PVector pos, PVector scale, String imageName, float lifeTime) {
    super(pos, 0, scale);
    setColor(color(0, 0, 255));
    load(imageName);
    this.lifeTimer = 0;
    this.lifeTime = lifeTime;
  }

  @Override
    public void update() {
    super.update();
    updateLifeTimer();
  }

  @Override
    public void draw() {
    super.draw();
    drawImage(position.x, position.y);
  }
  public void updateLifeTimer(){
      lifeTimer += time.deltatime();
  }
  
  public boolean isDead(){
     return lifeTimer >= lifeTime; 
  }


  @Override
    public void drawShape() {
    fill(c);
    //stroke(0, 255, 0);
    ellipse(0, 0, scale.x, scale.y);
  }
}
