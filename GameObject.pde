import java.awt.Rectangle;

abstract class GameObject {
  protected GameObject parent;
  protected ArrayList<GameObject> childrens;
  protected PVector position, pivot, rotation, scale;
  protected PImage image;
  protected float speed, rotSpeed, rotAngle;
  protected color c;
  protected char keyAssigned;
  protected Rectangle boudingBox;

  public GameObject(PVector position, float rotAngle) {
    this.childrens = new ArrayList<GameObject>();
    this.position = position;
    this.rotAngle = rotAngle;
    this.rotation = new PVector(0, 0);
    this.rotSpeed = 5;
  }
  public GameObject(PVector position, float rotAngle, PVector scale) {
    this(position, rotAngle);
    this.scale = scale;
    c = color(255);
  }
  public GameObject(PVector position, float rotAngle, PVector scale, float speed) {
    this(position, rotAngle, scale);
    this.speed = speed;
    
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
    //updateSelectedColor();
    updateRotation();
  }
  public void updateRotation() {
    rotation = new PVector(cos(rotAngle), sin(rotAngle));
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
  public void drawShape() {
    fill(c);
    //stroke(0, 255, 0);
    rect(0, 0, scale.x, scale.y);
  }
  public void drawWithRotation() {
    pushMatrix();
    translate(position.x, position.y);
    rectMode(CENTER);
    rotate(rotAngle);
    
    drawShape();
    for (GameObject child : childrens) {
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
  public GameObject getParent() {
    return parent;
  }
  public void setParent(GameObject parent) {
    this.parent = parent;
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
  public void setColor(color c) {
    this.c = c;
  }

  public void addChildren(GameObject children) {
    children.setParent(this);
    childrens.add(children);
  }
  public ArrayList<GameObject> getChildrens() {
    return childrens;
  }

  
}
