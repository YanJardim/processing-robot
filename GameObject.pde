import java.awt.Rectangle;

abstract class GameObject {
  protected GameObject parent;
  protected ArrayList<GameObject> childrens;
  protected PVector position, pivot, rotation, scale;
  protected PImage image, axis;
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
    this.axis = loadImage("images/arm/Braço2&3-2.png");
    this.boudingBox = new Rectangle((int)(position.x - scale.x / 2), (int)(position.y - scale.y / 2), (int)scale.x, (int)scale.y);
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
    this.image = loadImage(imageName);
  }
  public void load(String imageName) {
    this.image = loadImage(imageName);
  }
  public void draw() {
    update();
  }

  public void update() {
    updateImage();

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
    image(image, x, y, scale.x, scale.y);
  }
  public void drawShape() {
    fill(c);
    //stroke(0, 255, 0);
    rect(0, 0, scale.x, scale.y);
  }

  public void updateImage() {
    float parentOffsetX = parent != null ?  parent.getScale().x / 2 : 0;
    float parentOffsetY = parent != null ?  parent.getScale().y / 2 - 5 : 0;
    boudingBox.setLocation((int)(position.x - parentOffsetX), (int)(position.y - parentOffsetY));
  }
  public void updateBoudingBox() {
    boudingBox = new Rectangle((int)(position.x - scale.x / 2), (int)(position.y - scale.y / 2), (int)scale.x, (int)scale.y);
  }
  public void drawBoudingBox() {
    noFill();
    stroke(200, 0, 50);
    rect((float)boudingBox.getX(), (float)boudingBox.getY(), (float)boudingBox.getWidth(), (float)boudingBox.getHeight());
  }


  public void applyRotation() {
    rotation.x = cos(rotAngle);
    rotation.y = sin(rotAngle);
  }

  public void drawAxis(int size) {

    image(axis, -size / 2, -size / 2, size, size);
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

  public PVector getPivot() {
    return pivot;
  }
  public void setPivot(PVector pivot) {
    this.pivot = pivot;
  }
  public void setPivot(Pivots mode) {
    switch(mode) {
    case MIDDLE:
      setPivot(new PVector(scale.x / 2, scale.y / 2));  
      break;
    case MIDDLELEFT:
      setPivot(new PVector(0, scale.y / 2));  
      break;
    case MIDDLERIGHT:
      setPivot(new PVector(scale.x, scale.y / 2));  
      break;
    case BOTTOMLEFT:
      setPivot(new PVector(0, scale.y));  
      break;
    case BOTTOMRIGHT:
      setPivot(new PVector(scale.x, scale.y));  
      break;
    case TOPLEFT:
      setPivot(new PVector(0, 0));  
      break;
    case TOPRIGHT:
      setPivot(new PVector(scale.x, 0));  
      break;
    }
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
