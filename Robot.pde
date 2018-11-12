Time time;

BodyPart arm, forearm, hand;
Axis armAxis, forearmAxis;

BodyPart selected;
final int axisSize = 50;
final int axisHalf = axisSize / 2;
void setup() {
  size(500, 500);
  time = new Time();
  
  arm = new BodyPart(new PVector(50, 40), new PVector(100, 50), true);
  armAxis = new Axis(new PVector(arm.getScale().x / 2 - axisHalf, 0), new PVector(axisSize, axisSize));
  forearm = new BodyPart(new PVector(arm.getScale().x / 2, 0), new PVector(100, 40), false);
  hand = new BodyPart(new PVector(forearm.getScale().x / 2 - axisHalf, 0), new PVector(70, 50), false);
  
  arm.addChildren(armAxis);
  armAxis.addChildren(forearm);
  forearm.addChildren(hand);
  selected = arm;
}

void draw() {
  
  background(0);
  time.setDeltaTime();
  
  arm.draw();

  
  time.setLastTime();
}


void keyPressed(){
   if(key == '1'){
      selectPart(arm);
   }
   if(key == '2'){
      selectPart(forearm);
   }
   if(key == '3'){
      selectPart(hand);
   }
}

void selectPart(BodyPart obj){
    obj.setSelected(true);
    selected.setSelected(false);
    selected = obj;
}
