class GameManager {

  private int points, gameDuration;
  private float timer;
  private State gameState;
  private PFont defaultFont;

  public GameManager(int gameDuration) {
    this.points = 0;
    this.timer = 0;
    this.gameDuration = gameDuration;
    this.gameState = State.GAME;
    defaultFont = createFont("fonts/default.otf", 32);
  }
  public void update() {
    timer += time.deltatime(); 
    if (timer >= gameDuration) {
      changeState(State.GAMEOVER);
    }
  }

  public void draw() {
    textFont(defaultFont);
    if (compareState(State.GAME)) {
      drawGameText();
    } else if (compareState(State.GAMEOVER)) {
      drawGameOverText();
    }
  }
  public void addPoints(int amount) {
    points += amount;
    points = points < 0 ? 0 : points;
  }

  public void drawGameText() {
    textAlign(LEFT);
    textSize(20); 
    fill(255);
    text("Score: " + points, -width / 2 + 10, -height / 2 + 20);
    text("Time: " + (int)timer, -width / 2 + 10, -height / 2 + 50);
  }
  public void drawGameOverText() {
    textAlign(CENTER);
    textSize(26); 
    fill(255);
    text("Gameover", 0, 0);
    textSize(23); 
    text("Score: " + points, 0, 40);
  }

  public State getGameState() {
    return gameState;
  }

  public boolean compareState(State gameState) {
    return this.gameState == gameState;
  }

  public void changeState(State gameState) {
    this.gameState = gameState;
  }
}

public enum State {
  GAME, 
    GAMEOVER
}
