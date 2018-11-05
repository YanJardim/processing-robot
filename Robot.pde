Time time;

GameObject torso;
GameObject armL, armR, handL, handR, head, legL, legR, footL, footR;

GameObject selectedObject;

void setup() {
  size(500, 500);
  time = new Time();
  torso = new GameObject(new PVector(0, 0), 0, new PVector(30, 50), 10, new PVector(0, 0));
  head = new GameObject(new PVector(0, -20), 0, new PVector(50, 50), 10);
  armL = new GameObject(new PVector(-20, 0), 0, new PVector(50, 20), 10);
  armR = new GameObject(new PVector(20, 0), 0, new PVector(50, 20), 10);
  handL = new GameObject(new PVector(-18, 0), 0, new PVector(20, 20), 10);
  handR = new GameObject(new PVector(18, 0), 0, new PVector(20, 20), 10);
  legL = new GameObject(new PVector(-5, 20), 0, new PVector(10, 30), 10);
  legR = new GameObject(new PVector(5, 20), 0, new PVector(10, 30), 10);
  footL = new GameObject(new PVector(-2, 8), 0, new PVector(20, 5), 10);
  footR = new GameObject(new PVector(2, 8), 0, new PVector(20, 5), 10);
  
  torso.addChildren(armL);
  torso.addChildren(armR);
  torso.addChildren(head);
  torso.addChildren(legL);
  torso.addChildren(legR);
  
  armL.addChildren(handL);
  armR.addChildren(handR);
  
  legL.addChildren(footL);
  legR.addChildren(footR);
  
  //torso.addChildren(test);
  
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
   if(key == '3'){
       selectAxis(handL);
   }
   if(key == '4'){
       selectAxis(armR);
   }
   if(key == '5'){
       selectAxis(handR);
   }
   if(key == '6'){
       selectAxis(legR);
   }
   if(key == '7'){
       selectAxis(footR);
   }
   
   if(key == '8'){
       selectAxis(legL);
   }
   if(key == '9'){
       selectAxis(footL);
   }
   if(key == '0'){
       selectAxis(head);
   }
}

void selectAxis(GameObject obj){
    selectedObject.setSelected(false);
    selectedObject = obj;
    obj.setSelected(true);
}
