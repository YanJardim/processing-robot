class GameManager {

  private int points;
  public GameManager() {
    this.points = 0;
  }
  public void addPoints(int amount) {
    points += amount;
  }

  public void drawText() {
    fill(255);
    text("Score: " + points, -width / 2 + 20, -height / 2 + 20);
  }
}
