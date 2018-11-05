import java.awt.Rectangle;

class GameObject {
    private GameObject parent;
    private ArrayList<GameObject> childrens;
    private PVector position;
    private PVector pivot;
    private PVector rotation;
    private PVector scale;
    private PImage image;
    private float speed;
    private color c;
    private float rotAngle;
    private boolean selected;
    private char keyAssigned;

    public GameObject(PVector position, float rotAngle) {
        this.childrens = new ArrayList<GameObject>();
        this.position = position;
        this.rotAngle = rotAngle;
        this.selected = false;
    }
    public GameObject(PVector position, float rotAngle, PVector scale) {
        this(position, rotAngle);
        this.scale = scale;
    }
    public GameObject(PVector position, float rotAngle, PVector scale, float speed) {
        this(position, rotAngle, scale);
        this.speed = speed;
        c = color(255);
    }
    public GameObject(PVector position, float rotAngle, PVector scale, float speed, PVector pivot) {
        this(position, rotAngle, scale, speed);
        this.pivot = pivot;
    }
    public GameObject(PVector position, float rotAngle, PVector scale, float speed, color c) {
        this(position, rotAngle, scale, speed);
        this.c = c;
    }
    public GameObject(String imageName, PVector position, float rotAngle, PVector scale, float speed) {
        this(position, rotAngle, scale, speed);
        this.image = loadImage("images/" + imageName + ".png");
    }

    public void draw() {
        drawWithRotation();
        update();
        //drawBoudingBox();
    }
    public void update() {
      if(selected){
        c = color(255, 0, 0); 
        getInput();
      }
      else{
         c = color(255); 
      }
    }
    public void getInput(){
       if(keyPressed){
           if(key == 'a'){
              rotAngle -= time.deltatime() * speed; 
           }
           if(key == 'd'){
              rotAngle += time.deltatime() * speed; 
           }
        } 
    }
    public float getAngle() {
        return atan2(-rotation.x, rotation.y);
    }
    public void drawImage() {
        if (image == null) return;
        imageMode(CENTER);
        drawImage(position.x, position.y);
    }
    public void drawImage(float x, float y) {
        imageMode(CENTER);
        image(image, x, y, scale.x, scale.y);
    }
    public void drawShape(){
        fill(c);
        stroke(0, 255, 0);
        rect(0, 0, scale.x, scale.y);
    }
    public void drawWithRotation() {
        pushMatrix();
          translate(position.x, position.y);
          rectMode(CENTER);
          rotate(rotAngle);
          drawShape();
          for(GameObject child : childrens){
            pushMatrix();
              translate(child.getPosition().x, child.getPosition().y);
              //rotate(child.rotAngle);
              child.draw();
            popMatrix();
          }
          
        popMatrix();
    }
    
    public void applyRotation() {
        rotation.x = cos(rotAngle);
        rotation.y = sin(rotAngle);
    }


    //GETTERS AND SETTERS
    public PVector getPosition() {
        return position;
    }
    public void setPosition(PVector position) {
        this.position = position;
    }
    public PVector getRotation() {
        return rotation;
    }
    public void setRotation(PVector rotation) {
        this.rotation = rotation;
    }


    public PVector getScale() {
        return scale;
    }
    public void setScale(PVector scale) {
        this.scale = scale;
    }

    public color getColor() {
        return c;
    }
    public void setScale(color c) {
        this.c = c;
    }
    
    public void addChildren(GameObject children){
        childrens.add(children);
    }
    public ArrayList<GameObject> getChildrens(){
       return childrens; 
    }
    
    public void setSelected(boolean value){
       this.selected = value;
       
    }
    public boolean isSelected(){
      return selected;
    }
    

}
