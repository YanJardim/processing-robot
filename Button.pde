class Button extends GameObject {
  private float lifeTimer, lifeTime;
  private boolean dead;
  private int points;
  public Button(PVector pos, PVector scale, String imageName, float lifeTime, int points) {
    super(pos, 0, scale);
    setColor(color(0, 0, 255));
    load(imageName);
    this.lifeTimer = 0;
    this.lifeTime = lifeTime;
    this.dead = false;
    this.points = points;
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
    drawBoudingBox();
  }
  public void updateLifeTimer(){
      lifeTimer += time.deltatime();
      if(lifeTimer >= lifeTime){
         die(); 
      }
  }
  public int getPoints(){
    return points;
  }
  public boolean isDead(){
     return dead; 
  }
  
  public void die(){
     dead = true; 
  }


  @Override
    public void drawShape() {
    fill(c);
    //stroke(0, 255, 0);
    ellipse(0, 0, scale.x, scale.y);
  }
}
