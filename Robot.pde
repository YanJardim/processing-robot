Time time;

GameObject torso;
GameObject armL, armR, handL, handR;

GameObject selectedObject;

void setup() {
  size(500, 500);
  time = new Time();
  torso = new GameObject(new PVector(0, 0), 0, new PVector(30, 50), 10);
  armL = new GameObject(new PVector(15, 0), 0, new PVector(50, 20), 10);
  armR = new GameObject(new PVector(0, 0), 0, new PVector(-50, 20), 10);
  handL = new GameObject(new PVector(20, 0), 0, new PVector(20, 20), 10);
  torso.addChildren(armL);
  torso.addChildren(armR);
  armL.addChildren(handL);
  
  selectedObject = torso;
  
}

void draw() {
  translate(width / 2, height / 2);
  background(0);
  time.setDeltaTime();
  
  
  torso.draw();
  
  time.setLastTime();
}

void keyPressed(){
   if(key == '1'){
       selectAxis(torso);
   }
   if(key == '2'){
       selectAxis(armL);
   }
}

void selectAxis(GameObject obj){
    selectedObject.setSelected(false);
    selectedObject = obj;
    obj.setSelected(true);
}
