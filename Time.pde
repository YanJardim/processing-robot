class Time {
    private float deltaTime;
    private float lastTime;

    public Time() {
        deltaTime = 0;
        lastTime = 0;
    }
    public void  setDeltaTime() {
        deltaTime = millis() - lastTime;
    }
    public void  setLastTime() {
        lastTime = millis();
    }

    public float deltatime() {
        return deltaTime / 1000;
    }
}
