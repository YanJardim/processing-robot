class ButtonSpawner {
  private float spawnTime, timer;
  private ArrayList<Button> buttons;
  private PVector area;
  public ButtonSpawner(float spawnTime, PVector area) {
    this.spawnTime = spawnTime;
    this.area = area;
    this.buttons = new ArrayList<Button>();
  }
  public void update() {
    timer += time.deltatime();
    if(timer >= spawnTime){
       spawn();
       timer = 0;
    }
  }
  public void draw() {
    for(Button b : buttons){
        b.draw();
    }
  }
  public void spawn(){
    PVector pos = new PVector(random(area.x), random(area.y));
    pos.x = pos.x - area.x / 2;
    pos.y = pos.y - area.y / 2;
    PVector scale = new PVector(50, 50);
    String name = random(2) != 0 ? "BotãoVerde" : "BotãoVermelho";  
    Button b = new Button(pos, scale, "images/buttons/" + name + ".png");
    buttons.add(b);
  }
}
